# Stan startowy demo DoRoboty.ai

## Co jest przygotowane

Profil produktu, mapa właścicieli, trzy definicje, potrzeby obu stron rynku, zapis decyzji z fabuły, otwarte pytania, brief oceny pomocy AI i starsze robocze kryteria do gardeningu. Wszystkie nowe strony mają `needs_review` i `reviewed_at: null`: nie deklarujemy przeprowadzenia przeglądu przez człowieka.

Wspólne źródła to udostępnialny wyciąg z opisu case'u oraz jawne założenia demonstracji. Repo nie zawiera prywatnej notatki, jej tabeli ani roboczych zapisków autora. Starsza karta kryteriów to celowo przygotowany materiał dydaktyczny, nie rzeczywista decyzja firmy.

## Zanim rozpoczniesz pokaz z team-query

1. Przejrzyj i przyjmij pakiet startowy przez PR. Reviewer to inna osoba niż autor. Po rzeczywistym przeglądzie odpowiednio uaktualnij daty i statusy dokumentów; starsze kryteria mogą pozostać `needs_review` jako otwarte założenie.
2. Sprawdź uprawnienia `strzalex` i aktywną ochronę domyślnej gałęzi według [instrukcji](uruchomienie-github.md). Wpisy właścicieli i plik CODEOWNERS nie zapewniają ich automatycznie. Repo musi wymagać review oraz `knowledge-check` także w praktyce.
3. W nowej rozmowie w klonie zespołu sprawdź tożsamość i SHA domyślnej gałęzi. Lokalne pliki na gałęzi przygotowawczej są propozycją; team-query nie przedstawia ich jako przyjętej wiedzy.
4. Zachowaj prywatny Superbrain niepołączony do momentu demonstracji team-connect. Druga osoba używa osobnego klonu wspólnego repo.

## Pytania kontrolne

- "Dla kogo jest DoRoboty.ai i dlaczego w case'ie wybrano pomoc AI w opisach?" - odpowiedź ma odsyłać do profilu, potrzeb obu stron i D-001, zaznaczając fikcyjny kontekst.
- "Czy mamy analizę liczbową dopasowania i przejść do kolejnego etapu przed i po pomocy AI?" - w stanie startowym odpowiedź ma wskazać brak udostępnionej analizy. Nie wolno uzupełniać liczb z pamięci prywatnej rozmowy.
- "Czy wyższy wynik dopasowania sam wystarcza do ogłoszenia sukcesu?" - agent powinien wskazać ograniczenia wskaźnika i niezweryfikowane założenie ze starszej karty.
- "Kto ocenia zmianę przygotowaną przez telemetrik?" - reviewer i zastępca to strzalex; uprawnienia trzeba potwierdzić osobno.

## Kontrola lokalna

Uruchom `ruby scripts/check.rb`. Kontrola sprawdza strukturę i linki; nie zastępuje review merytorycznego ani weryfikacji reguł GitHuba. Nie przeprowadzono tutaj pełnego pokazu z drugim uczestnikiem.
