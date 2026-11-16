---
name: team-connect
description: Uruchom w klonie zespołu, aby podłączyć wskazane prywatne repo, zainstalować w nim team-share i dopisać reguły do AGENTS.md.
---
# Podłącz prywatnego Superbraina

1. Użyj bieżącego klonu jako repo zespołu. Ustal ścieżkę do prywatnego repo, w razie potrzeby poproś o nią użytkownika. Sprawdź, czy to osobny katalog główny i czy sesja ma do niego zapis. Potwierdź `origin`, status `verified` i odczyt `8-System/context-entry.md` według [procedury Git](../../../8-System/git-read.md). Przy braku dostępu podaj, którego katalogu lub repo dotyczy problem.
2. W prywatnym `8-System/team-context.md` dodaj albo uaktualnij wpis tego zespołu według [szablonu](../../../6-Templates/team-context.md). Tożsamość i ścieżkę klonu odczytaj z repo zespołu. Zakres weź z jego profilu i polecenia użytkownika. Zachowaj pozostałe połączenia.
3. Skopiuj [team-share](../../../6-Templates/private-skills/team-share/SKILL.md) do `.agents/skills/team-share/SKILL.md` w prywatnym repo, jeśli jeszcze go tam nie ma. Dla Claude Code dodaj względny symlink `.claude/skills/team-share`. Zastosuj [regułę z instrukcji](../../../docs/instalacja-w-prywatnym-repo.md) w prywatnym `AGENTS.md` oraz w istniejącym `CLAUDE.md`, jeśli ten plik jest utrzymywany samodzielnie. Przy ponownym uruchomieniu zaktualizuj istniejący wpis. Zachowaj treść pozostałych instrukcji.
4. Sprawdź połączenie na pytaniu wymagającym źródła zespołu przez [team-query](../team-query/SKILL.md). Pokaż źródło, SHA i listę zmienionych prywatnych plików.
