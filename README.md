Don't Starve CZ (cca 72%)
=========================
**Czech translation mod for Don't Starve [A Moderately Friendly Update (Sep10)]**<br />
**Mód českého překladu hry Don't Starve [Rozumně přátelský update (Září10)]**


POUŽITÍ/INSTALACE MÓDU
----------------------
- Pro použití módu ve hře je možné stáhnout repozitář kliknutím na tlačítko Download ZIP vpravo.
- Jako mód se používá složka czechlanguage s jejím obsahem.<br />
(Složka módu se vloží standardně přímo do adresáře mods hry Don't Starve.)<br />
- Máte-li instalovaný tento mód ze zdroje Steam Workshop, dejte si pozor, abyste aktivovali správnou verzi tohoto módu.

POUŽITÍ/INSTALACE FONTŮ
-----------------------
- Stáhněte si poslední verzi repozitáře, např. vizte postup výše.
- Zkopírujte ze složky fonts soubory fontů do složky hry - data/fonts/ a přepište existující soubory.
- Dále ze složky fonts zkopírujte soubor czech_ascii.po a nahraďte jím stejnojmenný soubor ve složce tohoto módu (czechlanguage)
**Poznámka:** Z testovacích důvodů si pro jistotu vytvořte zálohu všech souborů, které nahrazujete.

PŘEKLAD
-------
Máte-li zájem o překlad, upravujte soubor czech.po v kořenovém adresáři repozitáře, vytvořte vlastní větev repozitáře, budu je sám slučovat do hlavní větve master.<br />
Skript transform slouží pro vygenerování souboru czech_ascii.po.<br />
Nemáte-li s Git zkušenosti, stačí stáhnout repozitář (jak je popsáno výše), upravit soubor czech.po a zaslat mi ho na email, který najdete v mém profilu.

SOUBORY
-------
- **czech.po - soubor aktuálních překladů EN do CZ** (upravovat lze efektivně v [PoEdit](http://www.poedit.net/))
- strings.pot - originální soubor textů z aktuální verze hry
- preview.jpg - ikona módu
- transform - linux skript pro nastavení formátu souboru překladu, generuje czech_ascii.po ve složce czechlanguage
- czechlanguage/ - složka dat módu, připraveno k použití, neupravovat až na *.lua
 - czech.po - kopie czech.po z nadřazené složky
 - czech_ascii.po - soubor czech.po ve formátu ASCII s nakonfigurovanými parametry, generovaný skriptem transform
 - modinfo.lua - obecné nastavení módu
 - modmain.lua - nastavení souboru překladu k načtení do módu
- resources/ - složka obsahující .xfc soubory z programu Gimp 2.8.4, jedná se projekty pře(psaných|ložených) obrázků
- fonts/ - složka obsahující české fonty do hry, použití je popsáno výše

POZNÁMKA
--------
V současné chvíli hra Don't Starve nepodporuje kódování UTF-8. Z toho důvodu překlad probíhá dočasně ve dvou fázích.
 - Běžně se překládá soubor czech.po, který je v kódování UTF-8 a obsahuje překlad s diakritikou. To umožní okamžitou podporu diakritiky v okamžiku podpory tohoto kódování ve hře pouhým přepsáním hodnoty v souboru modmain.lua.
 - Dočasně se používá skript transform, který soubor czech.po upraví do czech_ascii.po tak, že mu přenastaví kódování na iso-8859-2, zruší diakritiku a správně ho nakonfiguruje.
Soubor czech_ascii.po je proto zatím ten, který je ve hře použit (nastavením v souboru modinfo.lua).

