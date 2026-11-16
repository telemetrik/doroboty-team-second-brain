# Team Second Brain

Wspólna baza wiedzy zespołu produktowego. Przechowuje decyzje, definicje, obserwacje o klientach, projekty i sposoby pracy. Zmiany przechodzą przez pull request, review drugiej osoby i merge.

## Publikacja jako szablon na GitHubie

Zapisz w Git całą zawartość tego katalogu jako główny katalog nowego repozytorium, w tym `.github/`, `.gitignore`, `.agents/` oraz symlinki w `.claude/`. Wypchnij commit na GitHuba i w ustawieniach repozytorium zaznacz **Template repository**. [Instrukcja GitHuba](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-template-repository)

## Uruchomienie dla zespołu

1. Utwórz repo zespołu przez **Use this template** i sklonuj je. [Instrukcja GitHuba](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template)
2. Uzupełnij [profil zespołu](8-System/team.md), [mapę kontekstu](8-System/context-entry.md) i [mapę właścicieli](8-System/owners.md). Dodaj pierwsze strony z [szablonów](6-Templates/README.md) i odnośniki w indeksach [wiedzy](4-Knowledge/index.md) lub [projektów](3-Projects/index.md).
3. Skonfiguruj [review na GitHubie](docs/uruchomienie-github.md), w tym rzeczywisty `CODEOWNERS` i reguły dla domyślnej gałęzi.
4. Otwórz nową sesję Codexa lub Claude Code w katalogu głównym klonu. [Skille zespołu](7-Skills/README.md) są dostępne z repozytorium. Instrukcje repo są w [AGENTS.md](AGENTS.md).
5. Jeśli korzystasz też z prywatnego Superbraina, wywołaj `team-connect` w klonie zespołu i podaj ścieżkę do prywatnego repo. Skill skonfiguruje połączenie, zainstaluje `team-share` i dopisze regułę do prywatnego `AGENTS.md`. [Instalacja i fragment AGENTS.md](docs/instalacja-w-prywatnym-repo.md)

Uruchom `ruby scripts/check.rb` z katalogu głównego. Tę samą kontrolę wykonuje GitHub Actions jako `knowledge-check`. [Test ręczny uruchomienia](docs/test-reczny.md)
