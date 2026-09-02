# System Zarzadzania Basenem

## Temat projektu

**System Zarzadzania Basenem** to aplikacja internetowa napisana w **PHP 8.5** i **Laravel 13**, przeznaczona dla obiektu basenowego, jego klientow oraz administratora. System laczy czesc publiczna, panel klienta i panel administratora w jednej aplikacji.

Glownym celem projektu jest uproszczenie obslugi podstawowych danych obiektu basenowego. Zamiast aktualizowac informacje recznie w wielu miejscach, administrator zarzadza karnetami, klientami, personelem i torami z jednego panelu, a klienci maja szybki dostep do aktualnej oferty i swoich zakupow.

## Cel aplikacji

Aplikacja rozwiazuje problem rozproszenia informacji i recznej obslugi prostych procesow zwiazanych z funkcjonowaniem basenu. Projekt udostepnia:

- publiczne informacje o obiekcie,
- katalog karnetow i ich ceny,
- podglad dostepnosci torow,
- rejestracje i logowanie klientow,
- zakup i anulowanie karnetow,
- panel administracyjny do zarzadzania danymi.

Na tle zwyklej strony informacyjnej projekt wyroznia sie tym, ze nie ogranicza sie do prezentacji tresci. Umozliwia tez realna obsluge kont i danych biznesowych wewnatrz systemu.

## Zakres funkcjonalnosci

### Uzytkownik niezalogowany

Uzytkownik bez logowania moze:

- wejsc na strone glowna,
- sprawdzic cennik karnetow,
- zobaczyc status torow,
- sprawdzic godziny otwarcia,
- przeczytac regulamin,
- obejrzec galerie,
- przejsc do logowania lub rejestracji.

### Klient

Po zalogowaniu klient moze:

- zobaczyc dane swojego konta,
- przegladac katalog karnetow,
- filtrowac oferte po nazwie, rodzaju i cenie,
- kupic wybrany karnet,
- anulowac wlasny zakup,
- przegladac liste swoich aktywnosci zakupowych.
- edytowac wlasny profil: imie, nazwisko, adres e-mail oraz opcjonalnie haslo.

### Administrator

Administrator po zalogowaniu ma dostep do panelu zarzadzania i moze:

- dodawac, edytowac, podgladac i usuwac karnety,
- dodawac klientow, podajac osobno imie, nazwisko, adres e-mail i haslo, oraz edytowac i usuwac ich konta,
- aktywowac i dezaktywowac konta klientow,
- dodawac i usuwac pracownikow,
- zmieniac status torow,
- przegladac podstawowe statystyki systemu.

## Technologie

| Element | Dokladna wersja | Oficjalna strona |
| --- | --- | --- |
| Jezyk backendu | PHP 8.5.6 | https://www.php.net/ |
| Framework | Laravel 13.11.2 | https://laravel.com/ |
| Silnik widokow | Blade 13.11.2 | https://laravel.com/docs/blade |
| Frontend | Tailwind CSS Browser Build `@tailwindcss/browser@4` | https://tailwindcss.com/ |
| Baza danych | PostgreSQL 18.4 | https://www.postgresql.org/ |
| Menedzer zaleznosci | Composer 2.10.3 (`composer.phar`) | https://getcomposer.org/ |
| Testy | PHPUnit 12.5 | https://phpunit.de/ |

## Wymagania projektowe

Projekt realizuje praktyczny zakres aplikacji CRUD i warstwy danych:

- dane sa przechowywane w relacyjnej bazie PostgreSQL,
- struktura bazy jest odtwarzana przez migracje Laravel,
- dane demonstracyjne sa dostarczane przez seedery,
- formularze maja walidacje po stronie serwera,
- dostep do panelu administratora jest ograniczony uprawnieniami,
- hasla uzytkownikow sa przechowywane w postaci hashy,
- zakup i anulowanie karnetow sa obslugiwane przez warstwe serwisowa.

## Uruchomienie projektu

### 1. Pobranie projektu

Jesli korzystasz z repozytorium:

```bash
git clone <adres-repozytorium>
cd basen-laravel
```

Jesli projekt masz juz lokalnie, przejdz po prostu do katalogu aplikacji.

### 2. Instalacja zaleznosci

W tym projekcie nie trzeba instalowac Node.js ani `npm`, poniewaz frontend nie korzysta z Vite podczas lokalnego uruchamiania.

Wariant z globalnym Composerem:

```bash
composer install
```

Wariant zgodny z obecnym srodowiskiem projektu:

```bash
C:\php85\php.exe composer.phar install
```

### 3. Konfiguracja pliku `.env`

Utworz plik `.env` na podstawie `.env.example`:

```bash
copy .env.example .env
```

Nastepnie ustaw polaczenie z baza danych:

```env
APP_NAME="System Basen"
APP_ENV=local
APP_DEBUG=true
APP_URL=http://127.0.0.1:8000

APP_LOCALE=pl
APP_FALLBACK_LOCALE=pl

DB_CONNECTION=pgsql
DB_HOST=127.0.0.1
DB_PORT=5432
DB_DATABASE=basen_laravel
DB_USERNAME=postgres
DB_PASSWORD=
```

### 4. Przygotowanie bazy danych

Utworz pusta baze PostgreSQL o nazwie `basen_laravel`.

Nastepnie wygeneruj klucz aplikacji:

```bash
C:\php85\php.exe artisan key:generate
```

I odtworz strukture oraz dane demonstracyjne:

```bash
C:\php85\php.exe artisan migrate:fresh --seed
```

### 5. Uruchomienie aplikacji

```bash
C:\php85\php.exe artisan serve
```

Po uruchomieniu aplikacja bedzie dostepna pod adresem:

[http://127.0.0.1:8000](http://127.0.0.1:8000)

### 6. Testy

Projekt przechodzi testy automatyczne:

```bash
C:\php85\php.exe artisan test
```

Ostatnia lokalna weryfikacja: **02.09.2026**, wynik **16/16 testow zaliczonych**.

## Dane testowe do logowania

| Rola | E-mail | Haslo |
| --- | --- | --- |
| Administrator | `admin@basen.pl` | `admin123` |
| Klient | `klient@basen.pl` | `klient123` |

Po seedowaniu system uzupelnia tez baze o wiekszy zestaw danych demonstracyjnych:

- 35 kont klientow,
- 12 karnetow,
- 12 pracownikow,
- 16 aktualnosci,
- 24 zakupy karnetow,
- 6 torow o roznych statusach.

## Podrecznik uzytkownika

### Strona glowna

Po wejściu na strone uzytkownik widzi menu, opis obiektu, aktualnosci i personel. To glowny ekran informacyjny dla osob, ktore chca poznac oferte basenu bez logowania.

![Strona glowna](Dokumentacja/strona_glowna.png)

Opis zrzutu: Ekran prezentuje publiczną część serwisu z menu, zdjęciem obiektu oraz sekcją informacyjną. W dalszej części strony znajdują się aktualności i personel.

### Logowanie i rejestracja

Ekran logowania pozwala wpisac adres e-mail i haslo. Z tego miejsca mozna tez przejsc do formularza rejestracji nowego klienta. Po poprawnym logowaniu system przekierowuje uzytkownika do panelu klienta albo administratora.

![Logowanie](Dokumentacja/logowanie.png)

Opis zrzutu: formularz logowania przyjmuje e-mail i haslo oraz wyswietla komunikaty bledu, na przyklad dla nieaktywnego konta lub blednych danych.

### Panel klienta

Panel klienta laczy dane konta, sekcje kupionych karnetow oraz katalog dostepnych ofert. Uzytkownik moze wyszukiwac i filtrowac karnety, kupowac je oraz anulowac swoje zakupy.

![Panel klienta](Dokumentacja/konto_klienta.png)

Opis zrzutu: widoczny jest panel klienta z informacjami o koncie, lista zakupionych karnetow oraz tabela oferty z filtrami.

### Panel administratora

Panel administratora sluzy do zarzadzania najwazniejszymi zasobami systemu. Zawiera zakladki `Karnety`, `Tory`, `Pracownicy` i `Klienci`, a dodatkowo pokazuje podstawowe statystyki obiektu.

![Panel administratora](Dokumentacja/panel_admina.png)

Opis zrzutu: panel administratora pokazuje liste klientow oraz narzedzia administracyjne do zarzadzania danymi systemu.

## Najwazniejsze mechanizmy

- routing aplikacji znajduje sie w `routes/web.php`,
- autoryzacja dostepu do panelu administratora jest oparta o role i uprawnienia,
- formularze wykorzystuja walidacje `Form Request`,
- dane sa obslugiwane przez modele Eloquent i relacje,
- zakup i anulowanie karnetow przechodzi przez warstwe serwisowa,
- system blokuje logowanie kont nieaktywnych,
- klient nie moze anulowac zakupu nalezacego do innego uzytkownika.

## Responsywnosc

Interfejs zostal przygotowany tak, aby dzialal rowniez na mniejszych ekranach:

- menu nawiguje sie w ukladzie zawijanym,
- sekcje przechodza z wielu kolumn do pojedynczego slupka,
- formularze dopasowuja szerokosc do urzadzenia,
- tabele w panelach sa osadzone w przewijanych kontenerach.

## Pliki pomocnicze i dokumentacja

- `Dokumentacja/basen_laravel.sql` - aktualny eksport bazy danych,
- `Dokumentacja/strona_glowna.png`, `Dokumentacja/logowanie.png`, `Dokumentacja/konto_klienta.png`, `Dokumentacja/panel_admina.png` - zrzuty ekranow wykorzystane w dokumentacji,
- `Dokumentacja/PodręcznikUżytkownika.txt` - skrocona instrukcja obslugi aplikacji.

## Plany rozbudowy

W kolejnych wersjach projektu mozna dodac:

- platnosci online za karnety,
- panel edycji aktualnosci i galerii,
- raporty sprzedazy dla administratora,
- odzyskiwanie hasla przez e-mail,
- powiadomienia dla klientow,
- kalendarz rezerwacji zajec i oblozenia torow.
