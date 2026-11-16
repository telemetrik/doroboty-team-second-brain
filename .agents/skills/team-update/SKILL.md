---
name: team-update
description: Zaktualizuj wiedzę po badaniu, eksperymencie lub decyzji zespołu. Przygotuj PR także z propozycji dostarczonej przez team-share.
---
# Zaktualizuj wiedzę

1. Przeczytaj wejście i dotknięte strony z [potwierdzonego SHA](../../../8-System/git-read.md). Przy propozycji z `team-share` sprawdź docelowe repo, SHA i zgodność patcha z aktualną bazą. Zastosuj [zasady awansowania](references/awansowanie.md), w tym akceptację zakresu przez autora.
2. Na lokalnej gałęzi od tego SHA zaktualizuj istniejące strony, źródła, indeksy i powiązania według [kontraktu strony](../../../6-Templates/README.md). Zapisuj decyzje rzeczywiście podjęte przez ludzi. Uruchom `ruby scripts/check.rb`.
3. Pokaż diff, uzasadnienie i ograniczenia. Wskaż [właściciela lub zastępcę](../../../8-System/owners.md) innego niż autor. Jeśli takiej osoby brakuje, skieruj przydział do opiekuna.
4. Przy upoważnieniu do publikacji otwórz PR do zweryfikowanego repo według [szablonu](../../../.github/PULL_REQUEST_TEMPLATE.md) i podaj jego adres oraz stan review. Przygotowanie lokalnej propozycji kończy się na diffie gotowym do oceny. O przyjęciu rozstrzygają ludzie w [obiegu review](../../../docs/uruchomienie-github.md).
