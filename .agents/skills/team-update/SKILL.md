---
name: team-update
description: Zaktualizuj wiedzę po badaniu, eksperymencie lub decyzji zespołu i otwórz Draft PR. Przyjmuj także zatwierdzone propozycje z team-share.
---
# Zaktualizuj wiedzę

1. Przeczytaj wejście i dotknięte strony z [potwierdzonego SHA](../../../8-System/git-read.md). Dla patcha z `team-share` zweryfikuj repo docelowe i zgodność patcha z aktualną bazą.
2. Na osobnej gałęzi od tego SHA zaktualizuj treść, źródła, indeksy i powiązania według [kontraktu strony](../../../6-Templates/README.md). Zapisuj decyzje rzeczywiście podjęte przez ludzi. Sprawdź diff i uruchom `ruby scripts/check.rb`.
3. Przy materiale prywatnym zastosuj [zasady awansowania](references/awansowanie.md). Jeśli autor jeszcze nie zaakceptował dokładnego zakresu, pokaż go w rozmowie i uzyskaj akceptację przed wypchnięciem gałęzi.
4. W ramach upoważnienia do publikacji wypchnij gałąź i od razu otwórz Draft PR w zweryfikowanym repo według [szablonu](../../../.github/PULL_REQUEST_TEMPLATE.md). W opisie podaj ograniczenia, wynik kontroli i [właściciela lub zastępcę](../../../8-System/owners.md) innego niż autor. Brak reviewera odnotuj w PR-ze i skieruj przydział do opiekuna. Potwierdź status draft i zwróć link. O gotowości do review i przyjęciu zmiany rozstrzygają ludzie zgodnie z [obiegiem review](../../../docs/uruchomienie-github.md).
