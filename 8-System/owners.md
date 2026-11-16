---
steward: null
areas:
  produkt:
    owner: null
    backup: null
  domena:
    owner: null
    backup: null
  badania:
    owner: null
    backup: null
  utrzymanie:
    owner: null
    backup: null
---
# Odpowiedzialność

Przypisz opiekuna w polu `steward` przed dodaniem stron wiedzy lub projektu. Dla używanych obszarów uzupełnij `owner` i `backup`, dostosuj zakresy do zespołu i odwzoruj odpowiedzialność w [CODEOWNERS](../.github/CODEOWNERS).

| Obszar | Typowe dokumenty |
| --- | --- |
| `produkt` | Projekty, decyzje i otwarte pytania |
| `domena` | Definicje i metryki |
| `badania` | Wiedza o klientach i praktyki badawcze |
| `utrzymanie` | Instrukcje i skille repo |

Zastępca przejmuje review, gdy właściciel jest autorem lub jest niedostępny. Opiekun pilnuje przydziału. Dokument może mieć własne pole `owner`, a zastępstwo wynika z obszaru.
