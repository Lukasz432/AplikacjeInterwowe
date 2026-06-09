[README.md](https://github.com/user-attachments/files/28730348/README.md)
# System Zarządzania Basenem

## Temat projektu

**System Zarządzania Basenem** to aplikacja internetowa wykonana w technologii PHP i Laravel. Projekt służy do obsługi podstawowych zasobów obiektu basenowego oraz udostępniania informacji dla klientów.

Aplikacja jest przeznaczona dla dwóch głównych typów użytkowników: klienta oraz administratora. Użytkownik niezalogowany może przeglądać publiczne informacje o basenie, natomiast po zalogowaniu dostępne są dodatkowe funkcje zależne od roli konta.

## Cel aplikacji

Celem projektu jest stworzenie prostej aplikacji CRUD dla obiektu basenowego. System pozwala zarządzać karnetami, klientami, pracownikami oraz torami basenowymi. Dodatkowo udostępnia publiczne zakładki takie jak cennik, godziny otwarcia, regulamin i galeria.

Aplikacja rozwiązuje problem ręcznego zarządzania podstawowymi informacjami o basenie. Administrator może aktualizować dane w jednym miejscu, a klient ma szybki dostęp do aktualnej oferty i swojego panelu.

## Zakres funkcjonalności

### Użytkownik niezalogowany

Użytkownik bez logowania może:

- wejść na stronę główną,
- sprawdzić cennik karnetów,
- zobaczyć dostępność torów,
- sprawdzić godziny otwarcia,
- przeczytać regulamin,
- obejrzeć galerię zdjęć,
- przejść do logowania lub rejestracji.

### Klient

Po zalogowaniu klient może:

- zobaczyć dane swojego konta,
- przeglądać dostępne karnety,
- filtrować cennik po nazwie, rodzaju i cenie,
- kupić wybrany karnet,
- anulować posiadany karnet.

### Administrator

Administrator po zalogowaniu ma dostęp do panelu zarządzania. Może:

- dodawać, edytować i usuwać karnety,
- zarządzać klientami,
- dodawać i usuwać pracowników,
- zmieniać status torów,
- filtrować i sortować dane,
- przeglądać podstawowe statystyki systemu.

## Technologie

| Element | Technologia |
| --- | --- |
| Język backendu | PHP |
| Framework | Laravel 13 |
| Frontend | Blade, Tailwind CSS |
| Baza danych | PostgreSQL |
| Środowisko lokalne | XAMPP |
| Menedżer zależności | Composer |

## Wymagania projektowe

Projekt realizuje podstawową funkcjonalność CRUD wymaganą na ocenę 3.0:

- aplikacja udostępnia ogólnodostępne zasoby,
- administrator zarządza zasobami systemu,
- dostępne są operacje tworzenia, odczytu, edycji i usuwania danych,
- dane są przechowywane w bazie danych,
- formularze posiadają podstawową walidację.

## Uruchomienie projektu

1. Pobierz i wypakuj plik `System_Basen.7z`.
2. Przejdź do katalogu aplikacji:

```bash
cd "C:\xampp\htdocs\System Basen\basen-laravel"
```

3. Zainstaluj zależności PHP:

```bash
composer install
```

4. Utwórz plik `.env` na podstawie `.env.example`:

```bash
copy .env.example .env
```

5. Wygeneruj klucz aplikacji:

```bash
php artisan key:generate
```

6. Skonfiguruj połączenie z bazą danych PostgreSQL w pliku `.env`.

Przykład:

```env
DB_CONNECTION=pgsql
DB_DATABASE=basen_db
DB_USERNAME=postgres
DB_PASSWORD=twoje_haslo
```

7. Zaimportuj bazę danych z pliku `basen_db.sql`.

8. Uruchom aplikację:

```bash
php artisan serve
```

Jeżeli komenda `php` nie działa globalnie, można użyć PHP z XAMPP:

```bash
C:\xampp\php\php.exe artisan serve
```

Adres lokalny aplikacji:

```text
http://localhost:8000
```

## Dane testowe do logowania

| Rola | E-mail | Hasło |
| --- | --- | --- |
| Administrator | `admin@basen.pl` | `admin123` |
| Klient | `klient@basen.pl` | `haslo1234` |

## Podręcznik użytkownika

### Strona główna

Po wejściu na stronę użytkownik widzi menu nawigacyjne oraz opis obiektu basenowego. Strona główna zawiera najważniejsze informacje o basenie i aktualności.

![Strona główna](strona_glowna.png)

### Logowanie

Ekran logowania pozwala wpisać adres e-mail oraz hasło. Po poprawnym zalogowaniu użytkownik zostaje przekierowany do panelu klienta lub administratora.

![Logowanie](logowanie.png)

### Panel klienta

Panel klienta pokazuje dane konta, listę posiadanych karnetów oraz cennik. Klient może kupić karnet, anulować go oraz filtrować listę dostępnych pozycji.

![Panel klienta](klient_zalogowany.png)

## Najważniejsze mechanizmy

- Routing aplikacji znajduje się w pliku `routes/web.php`.
- Widoki są przygotowane w systemie szablonów Blade.
- Formularze wykorzystują zabezpieczenie CSRF.
- Hasła użytkowników są przechowywane w formie zahashowanej.
- Panel administratora jest dostępny tylko po zalogowaniu na konto administratora.
- Filtrowanie danych działa po wpisaniu wartości w pola formularza i kliknięciu przycisku `Filtruj`.

## Pliki w repozytorium

- `System_Basen.7z` - skompresowany projekt aplikacji,
- `basen_db.sql` - eksport bazy danych,
- `Dokumentacja.7z` - dokumentacja projektu,
- `strona_glowna.png` - zrzut strony głównej,
- `logowanie.png` - zrzut ekranu logowania,
- `klient_zalogowany.png` - zrzut panelu klienta.

## Plany rozbudowy

W przyszłości aplikację można rozbudować o:

- płatności online,
- historię zakupów klienta,
- panel edycji aktualności,
- raporty dla administratora,
- powiadomienia e-mail.
