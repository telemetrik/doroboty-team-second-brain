# Ręczny test szablonu

## Sprawdź lokalną kopię

1. Otwórz katalog główny szablonu lub świeży klon utworzony z niego. Uruchom `ruby scripts/check.rb`. W pustym szablonie oczekuj 0 stron, 0 błędów i 0 uwag.
2. Otwórz nową sesję w katalogu głównym świeżego klonu. Sprawdź, czy klient widzi `team-connect`, `team-query`, `team-update` i `team-garden`. Wywołaj `$team-query` w Codexie albo `/team-query` w Claude Code. [Skille i wywołania](../7-Skills/README.md)
3. Uzupełnij profil zespołu, opiekuna i odpowiedzialność za jeden obszar. Przygotuj pierwszą stronę z [szablonu strony](../6-Templates/wiedza.md) i użyj dostępnego zespołowego źródła. Dodaj wpis w [indeksie wiedzy](../4-Knowledge/index.md). Sprawdź, czy kontrola przechodzi i wykrywa brak wpisu po jego chwilowym usunięciu w kopii testowej.

## Sprawdź GitHub i dostęp

1. Utwórz repo zespołu przez **Use this template**, przypisz autorowi i reviewerowi dostęp do zapisu i włącz [reguły review](uruchomienie-github.md).
2. Przygotuj PR z pierwszą stroną. Oczekuj zaliczonego `knowledge-check` i blokady merge do potwierdzenia drugiej osoby. Następnie poproś reviewera o zatwierdzenie i scal zmianę.
3. W drugim klonie zapytaj agenta o nową stronę. Oczekuj odpowiedzi ze źródłem i SHA zaakceptowanej wersji. Jeśli używasz prywatnego Superbraina, wywołaj `team-connect` w klonie zespołu i podaj ścieżkę prywatnego repo. Sprawdź, czy w prywatnym repo pojawiły się połączenie, skill `team-share` i reguła w `AGENTS.md`. Otwórz nową prywatną sesję i powtórz pytanie. [Instrukcja podłączenia](instalacja-w-prywatnym-repo.md)
