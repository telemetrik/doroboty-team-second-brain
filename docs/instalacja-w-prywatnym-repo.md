# Podłącz prywatnego Superbraina do zespołu

Sklonuj repo zespołu utworzone z szablonu i otwórz jego katalog w Codexie albo Claude Code. Sesja potrzebuje uprawnień do odczytu repo zespołu na GitHubie i zapisu w lokalnym prywatnym repo.

W sesji otwartej w repo zespołu wywołaj `$team-connect` w Codexie albo `/team-connect` w Claude Code. Podaj bezwzględną ścieżkę do prywatnego repo.

> $team-connect Podłącz moje prywatne repo /ścieżka/do/prywatnego-repo

Skill odczyta tożsamość bieżącego repo zespołu i w prywatnym repo uzupełni `8-System/team-context.md`, zainstaluje `team-share` i dopisze regułę do `AGENTS.md`.

W Codex CLI możesz otworzyć klon zespołu i dodać prywatny katalog z prawem zapisu jednym poleceniem.

```sh
codex --cd "/ścieżka/do/repo-zespołu" --add-dir "/ścieżka/do/prywatnego-repo"
```

## Instalacja ręczna

Zastąp ścieżki swoimi i uruchom z prywatnego repo.

```sh
team_repo="/bezwzgledna/sciezka/do/klonu-zespolu"
cd "/bezwzgledna/sciezka/do/prywatnego-repo"

mkdir -p .agents/skills/team-share 8-System
if [ ! -e .agents/skills/team-share/SKILL.md ]; then
  cp "$team_repo/6-Templates/private-skills/team-share/SKILL.md" \
    .agents/skills/team-share/SKILL.md
fi
if [ ! -e 8-System/team-context.md ]; then
  cp "$team_repo/6-Templates/team-context.md" 8-System/team-context.md
fi
```

Uzupełnij `8-System/team-context.md` o tożsamość repo zespołu, bezwzględną ścieżkę klonu, zakres tematów i punkty wejścia. Jeśli plik zawiera już inne połączenia, dopisz kolejną sekcję według [wzoru konfiguracji](../6-Templates/team-context.md).

Dla Claude Code utwórz symlink, jeśli jeszcze go nie masz.

```sh
mkdir -p .claude/skills
ln -s ../../.agents/skills/team-share .claude/skills/team-share
```

## Dopisz regułę w prywatnym AGENTS.md

Dodaj poniższy fragment do istniejącego pliku `AGENTS.md` w głównym katalogu prywatnego repo. Jeśli pliku jeszcze nie ma, utwórz go. W Claude Code użyj tej samej reguły w `CLAUDE.md` lub zaimportuj `AGENTS.md` przez `@AGENTS.md`.

```markdown
## Wiedza zespołu

- Gdy pytanie dotyczy połączonego zespołu, przeczytaj `8-System/team-context.md` i użyj `team-query` z klonu wskazanego w konfiguracji.
- Gdy proszę o przygotowanie propozycji dla zespołu z prywatnego materiału, użyj lokalnego skilla `.agents/skills/team-share/SKILL.md`.
```

Otwórz nową sesję w prywatnym repo. Zadaj pytanie sprawdzające wiedzę zespołu i porównaj źródło oraz SHA z przyjętą wersją. Następnie wywołaj `$team-share` w Codexie albo `/team-share` w Claude Code i wskaż prywatny materiał. Oczekuj patcha i szkicu PR-a w prywatnym `9-Outputs/`.
