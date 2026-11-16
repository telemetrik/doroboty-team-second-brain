# Odczyt przyjętej wersji Git

1. Sprawdź, czy katalog jest głównym katalogiem klonu (`git -C <klon> rev-parse --show-toplevel`). Odczytaj URL przez `git -C <klon> remote get-url origin` i porównaj z konfiguracją. Dla GitHuba formaty HTTPS i SSH mogą wskazywać to samo repo `HOST/OWNER/REPO`. Porównuj także host. Dla bare repo używanego w lokalnej próbie porównuj bezwzględną, rozwiązaną ścieżkę do `origin`. Usuń dane uwierzytelniające z wyświetlanych adresów. Przy innej tożsamości przerwij odczyt do wyjaśnienia.
2. Uruchom `python3 scripts/team_revision.py <klon>` z zaufanej kopii skryptu. `verified` oznacza commit zaobserwowany na domyślnej gałęzi `origin` i dostępny lokalnie. `cached` oznacza lokalny stan `origin/HEAD` bez potwierdzenia aktualności. `unavailable` oznacza brak używalnej wersji. Podaj tę różnicę użytkownikowi. Dla nowych połączeń i przygotowania PR-a wymagaj `verified`.
3. Odczytuj strony z jednego SHA przez `git -C <klon> show <SHA>:8-System/context-entry.md` i ten sam mechanizm dla indeksów, dokumentów oraz źródeł. Do wyszukiwania po drzewie użyj `git -C <klon> grep -in -e '<fraza>' <SHA> -- 3-Projects 4-Knowledge`. Linkuj do `https://github.com/OWNER/REPO/blob/<SHA>/<ścieżka>` lub podaj ścieżkę i SHA, gdy źródło nie ma adresu WWW.

Skrypt może pobrać obiekty Git. Nie przełącza gałęzi, nie modyfikuje drzewa roboczego ani indeksu i nie nadpisuje śledzonych refów. Bieżące pliki na dysku mogą zawierać propozycje. Pamięć podręczna jest użyteczna także przy przerwie w sieci, o ile klon nadal ma sprawdzoną tożsamość.

