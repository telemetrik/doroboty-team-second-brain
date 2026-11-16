---
name: team-share
description: Przygotuj w prywatnym Superbrainie propozycję udostępnienia fragmentu notatki albo wyniku połączonemu zespołowi. Pokaż diff i treść przyszłego PR-a do oceny autora.
---
# Przygotuj propozycję dla zespołu

1. Odczytaj wskazany materiał prywatny i wybierz zespół z `8-System/team-context.md`. Według `8-System/git-read.md` z klonu zespołu potwierdź tożsamość repo i SHA domyślnej gałęzi. Sprawdź dotknięte strony, indeksy i właścicieli w tej wersji.
2. Przygotuj zmianę w tymczasowej kopii z tego SHA, np. z `git archive`. Użyj treści, którą autor może udostępnić, oraz samodzielnego wyciągu z kontekstem i ograniczeniami. Zaktualizuj istniejące strony i indeksy. Uruchom `ruby scripts/check.rb` w kopii.
3. Zapisz w prywatnym `9-Outputs/` pełny patch obejmujący także nowe pliki oraz szkic PR-a. Pokaż diff, repo i SHA bazy, pliki i źródła, opis PR-a, planowaną wiadomość commita, reviewera i ewentualne załączniki. Sprawdź, czy patch nakłada się na czystą kopię z tego SHA i czy cały pakiet zawiera wyłącznie proponowaną wersję zespołową.
4. Zakończ na lokalnym pakiecie do oceny autora. Publikację zatwierdzonej wersji obsługuje `team-update` w klonie zespołu.
