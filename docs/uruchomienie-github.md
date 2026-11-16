# Uruchomienie review na GitHubie

Potrzebujesz repozytorium z GitHub Actions i ochroną gałęzi w aktualnym planie GitHuba oraz dwóch osób z własnymi kontami i dostępem do zapisu. Repo prywatne wymaga planu obsługującego reguły. Ustal poziom widoczności wspólnie z zespołem. [Dostępność rulesetów](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets)

1. Wprowadź profil zespołu w [team.md](../8-System/team.md) oraz opiekuna, właścicieli i zastępców w [owners.md](../8-System/owners.md). Włącz wzorce w [CODEOWNERS](../.github/CODEOWNERS), podstawiając osoby, które faktycznie mają dostęp `write`. Ostatni wzorzec pasujący do ścieżki określa właścicieli. Obejmij również sam plik `CODEOWNERS`, skille i reguły CI. [Jak działa CODEOWNERS](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners)
2. Umieść startową zawartość i prawidłowy `CODEOWNERS` na domyślnej gałęzi przy inicjalizacji nowego repo. Sprawdź widoczność CODEOWNERS i automatyczną prośbę o review na próbnym PR. Poczekaj, aż `knowledge-check` uruchomi się na tym PR. Przy repo już używanym wprowadź konfigurację przez istniejący proces review.
3. Administrator zapisuje regułę w Settings > Rules > Rulesets jako aktywną na domyślnej gałęzi. Użyj [konfiguracji rulesetu](../.github/knowledge-ruleset.json) importowanej w ustawieniach albo z poniższej komendy uruchomionej z katalogu głównego klonu po podstawieniu `OWNER/REPO`. Przy istniejącej równoważnej regule uaktualnij ją w ustawieniach.

   ```sh
   gh api -X POST repos/OWNER/REPO/rulesets --input .github/knowledge-ruleset.json
   ```

   Wymagaj PR-a, co najmniej jednej akceptacji, review właściciela, ponownej akceptacji po zmianie diffu, akceptacji przez osobę inną niż autor ostatniego pushu, rozstrzygnięcia rozmów i zaliczenia `knowledge-check`. Ustaw GitHub Actions jako oczekiwane źródło checka w interfejsie GitHuba. Pozostaw pustą listę wyjątków. Przy użyciu klasycznej ochrony gałęzi włącz te same warunki i ich stosowanie także wobec administratorów. [Reguły GitHuba](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/managing-rulesets/available-rules-for-rulesets)
4. Przejdź [test ręczny](test-reczny.md). Potwierdź na próbnym PR blokadę bez akceptacji, po zmianie diffu po akceptacji i przy błędzie kontroli. Po akceptacji drugiej osoby i spełnieniu kontroli merge ma być dostępny. W repo ćwiczeniowym sprawdź także odrzucenie normalnego bezpośredniego pushu na domyślną gałąź. Zachowaj adres testowego PR-a i wynik w dokumentacji wdrożenia.

Konfiguracja w pliku jest podstawą wdrożenia. Ochronę potwierdza stan aktywnej reguły i wynik próby w konkretnym repo. Ocenę merytoryczną przeprowadza człowiek. Kontrola `knowledge-check` sprawdza metadane, źródła lokalne, podstawowe linki Markdown i indeksy.
