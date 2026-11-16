# frozen_string_literal: true

require 'date'
require 'pathname'
require 'uri'
require 'yaml'

class KnowledgeCheck
  ROOT = Pathname.new(File.expand_path('..', __dir__))
  STATUSES = %w[active needs_review superseded archived].freeze
  TYPES = %w[knowledge definition decision practice questions project experiment summary].freeze
  LINK = /\]\(\s*(?:<([^>]+)>|([^\s)]+))(?:\s+"[^"]*")?\s*\)/

  def initialize
    @errors = []
    @warnings = []
    @pages = {}
    @ids = {}
  end

  def run
    owners = ROOT / '8-System/owners.md'
    validate_owners(owners)

    %w[3-Projects 4-Knowledge].each { |directory| check_index(ROOT / directory) }
    error(owners, 'przypisz opiekuna steward przed dodaniem stron') if @pages.any? && @steward.nil?
    check_successors
    ROOT.glob('**/*.md', File::FNM_DOTMATCH).sort.each do |file|
      next if relative(file).split('/').any? { |part| %w[.git .claude .venv].include?(part) }

      check_links(file)
    end

    @warnings.each { |warning| puts "UWAGA: #{warning}" }
    @errors.each { |error| warn "BŁĄD: #{error}" }
    puts "#{@pages.size} stron, #{@errors.size} błędów, #{@warnings.size} uwag."
    @errors.empty?
  end

  private

  def relative(path)
    path.relative_path_from(ROOT).to_s
  end

  def error(file, message)
    @errors << "#{relative(file)}: #{message}"
  end

  def frontmatter(file)
    block = file.file? && file.read.match(/\A---\r?\n(.*?)^---[ \t]*\r?$/m)
    data = YAML.safe_load(block[1], permitted_classes: [Date]) if block
    return data if data.is_a?(Hash)

    error(file, 'brak mapy metadanych YAML')
    {}
  rescue Psych::Exception => e
    error(file, "nieprawidłowe YAML: #{e.message}")
    {}
  end

  def present?(value)
    value.is_a?(String) && !value.strip.empty?
  end

  def valid_date?(value)
    value.is_a?(String) && value.match?(/\A\d{4}-\d{2}-\d{2}\z/) && Date.iso8601(value)
  rescue ArgumentError
    false
  end

  def validate_owners(file)
    data = frontmatter(file)
    @areas = data['areas']
    @steward = data['steward']
    unless data.key?('steward') && (@steward.nil? || present?(@steward))
      error(file, 'steward wymaga nazwy opiekuna lub null w pustym szablonie')
    end
    unless @areas.is_a?(Hash) && !@areas.empty?
      error(file, 'brak mapy areas')
      @areas = {}
    end
    @areas.each do |area, people|
      complete = people.is_a?(Hash) && %w[owner backup].all? do |role|
        people.key?(role) && (people[role].nil? || present?(people[role]))
      end
      error(file, "obszar #{area} wymaga pól owner i backup") unless complete
    end
  end

  def check_index(directory)
    index = directory / 'index.md'
    pages = directory.glob('**/*.md').sort - [index]
    unless index.file?
      error(index, 'brak indeksu')
      return
    end
    indexed = links(index).map { |ref| local_target(index, ref) }
    pages.each do |page|
      count = indexed.count(page)
      error(index, "oczekiwano jednego wpisu dla #{relative(page)}, jest #{count}") if count != 1
      check_page(page)
    end
  end

  def check_page(file)
    data = frontmatter(file)
    @pages[file] = data
    id = data['id']
    if !id.is_a?(String) || !id.match?(/\A[a-z0-9]+(?:-[a-z0-9]+)*\z/)
      error(file, 'nieprawidłowe id')
    elsif @ids.key?(id)
      error(file, "id #{id} występuje też w #{relative(@ids[id])}")
    else
      @ids[id] = file
    end

    error(file, 'nieznany type') unless TYPES.include?(data['type'])
    status = data['status']
    error(file, 'nieznany status') unless STATUSES.include?(status)

    check_owner(file, data)
    reviewed = data['reviewed_at']
    pending = data.key?('reviewed_at') && reviewed.nil? && status == 'needs_review'
    error(file, 'nieprawidłowe reviewed_at') unless pending || valid_date?(reviewed)
    if data.key?('next_review_at')
      due = data['next_review_at']
      if !valid_date?(due)
        error(file, 'nieprawidłowe next_review_at')
      elsif Date.iso8601(due) < Date.today && %w[active needs_review].include?(status)
        @warnings << "#{relative(file)}: termin przeglądu minął (#{due})."
      end
    end
    check_sources(file, data['sources'])
  end

  def check_owner(file, data)
    error(file, 'nieprawidłowe owner') if data.key?('owner') && !present?(data['owner'])
    people = @areas[data['area']]
    unless people.is_a?(Hash)
      error(file, "nieznany obszar #{data['area'].inspect}")
      return
    end
    if present?(people['owner']) && present?(people['backup']) && people['owner'] != people['backup']
      return
    end

    message = "obszar #{data['area']} wymaga właściciela i odrębnego zastępcy"
    if data['status'] == 'active'
      error(file, message)
    elsif data['status'] == 'needs_review'
      @warnings << "#{relative(file)}: #{message}."
    end
  end

  def check_sources(file, sources)
    unless sources.is_a?(Array) && !sources.empty?
      error(file, 'sources wymaga co najmniej jednego źródła')
      return
    end
    sources.each do |source|
      unless source.is_a?(Hash) && present?(source['ref'])
        error(file, 'źródło wymaga ref i access')
        next
      end

      ref = source['ref']
      case source['access']
      when 'team', 'restricted'
        target = local_target(file, ref)
        error(file, "brak wspólnego pliku źródła #{ref}") unless target && inside?(target) && target.file?
      when 'external'
        uri = parse_uri(ref)
        error(file, "oczekiwano adresu HTTPS w źródle #{ref}") unless uri&.scheme == 'https' && uri.host
      else
        error(file, "nieznany access dla źródła #{ref}")
      end
    end
  end

  def check_successors
    @pages.each do |file, data|
      next unless data['status'] == 'superseded' || data.key?('superseded_by')

      successor = @ids[data['superseded_by']]
      if data['status'] != 'superseded' || !successor || successor == file
        error(file, 'superseded_by wymaga statusu superseded i ID innej strony')
        next
      end
      unless links(file).any? { |ref| local_target(file, ref) == successor }
        error(file, 'brak odnośnika do następcy w treści')
      end

      visited = [file]
      while successor && !visited.include?(successor)
        visited << successor
        successor = @ids[@pages[successor]['superseded_by']]
      end
      error(file, 'cykl odnośników superseded_by') if successor
    end
  end

  def links(file)
    text = file.read.sub(/\A---\r?\n.*?^---[ \t]*\r?$/m, '')
    fence = nil
    text.each_line.flat_map do |line|
      marker = line[/\A {0,3}(`{3,}|~{3,})/, 1]
      if fence
        fence = nil if marker && marker[0] == fence[0] && marker.size >= fence.size && line.strip == marker
        []
      elsif marker
        fence = marker
        []
      else
        line.scan(LINK).map { |angle, bare| angle || bare }
      end
    end
  end

  def parse_uri(ref)
    URI.parse(ref)
  rescue URI::InvalidURIError
    nil
  end

  def local_target(file, ref)
    return if ref.match?(/\A(?:[a-z][a-z0-9+.-]*:|\/\/|#)/i)

    path = URI::DEFAULT_PARSER.unescape(ref.split(/[?#]/, 2).first)
    return if path.empty?

    file.dirname.join(path).cleanpath
  end

  def inside?(path)
    return false unless path.exist?

    resolved = path.realpath
    resolved == ROOT || resolved.to_s.start_with?(ROOT.to_s + '/')
  end

  def check_links(file)
    links(file).each do |ref|
      target = local_target(file, ref)
      error(file, "uszkodzony link #{ref}") if target && !inside?(target)
    end
  end
end

exit(KnowledgeCheck.new.run ? 0 : 1)
