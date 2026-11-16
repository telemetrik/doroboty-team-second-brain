---
name: team-garden
description: Zrób przegląd utrzymania zespołowego Superbraina albo przygotuj wybraną naprawę sprzeczności, duplikatu, braku właściciela lub innego problemu z wiedzą.
---
# Gardening

## Przegląd

- Ustal zakres i [wersję](../../../8-System/git-read.md). Za pomocą `ruby scripts/check.rb` sprawdź kopię tej wersji. Sprawdź dostępność źródeł, sprzeczności, duplikaty, braki właścicieli, luki i potrzebę przeglądu. Sprawdź syntezy zakończonych projektów i [kolejkę utrzymania](../../../8-System/maintenance.md). Przy braku dostępu do Issues lub PR-ów nazwij pominięty zakres.
- Podaj problemy według wpływu, z dowodem, działaniem i [osobą do rozstrzygnięcia](../../../8-System/owners.md). Brak właściciela przekaż opiekunowi. Raport zostaw w rozmowie, chyba że użytkownik zleci zapis.

## Wybrana naprawa

- Sprzeczne ustalenia skieruj do właściciela z obiema podstawami. Przy duplikacie zaproponuj następcę, zachowując unikalną treść. Uzgodnioną naprawę przygotuj przez [team-update](../team-update/SKILL.md).
- Przy upoważnieniu do zgłoszenia sprawdź istniejące Issues i użyj [szablonu](../../../.github/ISSUE_TEMPLATE/utrzymanie-wiedzy.md).
