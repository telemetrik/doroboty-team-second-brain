# Szablony dokumentów

- [Strona wiedzy lub definicja](wiedza.md).
- [Decyzja](decyzja.md).
- [Eksperyment i wynik](eksperyment.md).
- [Brief lub synteza projektu](projekt.md).
- [Praktyka](praktyka.md).
- [Udostępnialny wyciąg ze źródła](wyciag.md).
- [Prywatna konfiguracja zespołu](team-context.md).

## Kontrakt strony

Pliki Markdown w `3-Projects/` i `4-Knowledge/` poza ich głównymi indeksami mają frontmatter YAML. Utrzymuj jeden wpis w odpowiednim indeksie dla każdej strony, również po zmianie jej statusu na historyczny.

| Pole | Wartość |
| --- | --- |
| `id` | Unikalny, stabilny identyfikator z małych liter ASCII, cyfr i myślników. |
| `type` | `knowledge`, `definition`, `decision`, `practice`, `questions`, `project`, `experiment` lub `summary`. |
| `area` | Klucz z [mapy właścicieli](../8-System/owners.md). Strona aktywna wymaga właściciela i zastępcy obszaru. |
| `owner` | Opcjonalna osoba odpowiedzialna za konkretną stronę. |
| `status` | `active`, `needs_review`, `superseded` lub `archived`. |
| `reviewed_at` | Data przeglądu merytorycznego w cudzysłowie, `YYYY-MM-DD`, lub `null` dla strony oczekującej na pierwszy przegląd. |
| `sources` | Lista wpisów z `access` i `ref`. `team` oznacza ścieżkę względną do pliku w tym repo, `external` adres HTTPS do źródła poza repo, `restricted` ścieżkę względną do wspólnego wyciągu lub relacji z ograniczeniem dostępu do oryginału. |
| `superseded_by` | Wymagany przy `superseded`. Zawiera ID następcy w tym repo. Podaj także odnośnik do następcy w treści. |
| `next_review_at` / `review_when` | Opcjonalna data albo warunek przeglądu odpowiedni dla treści. |

Pisz w treści, które twierdzenia są obserwacją, hipotezą lub przyjętą decyzją. Status strony dotyczy jej aktualności. Udostępnione materiały źródłowe w `5-Raw/` opisują pochodzenie, zakres i ograniczenia.
