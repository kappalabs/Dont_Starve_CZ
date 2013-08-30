Don't Starve CZ (cca 30%)
=========================
Czech translation mod for Don't Starve<br />
Mód českého překladu hry Don't Starve

SOUBORY
-------
- czech.po	  - soubor aktuálnních překladů EN do CZ (upravovat lze efektivně v PoEdit)
- czech.mo	  - pomocný soubor programu PoEdit
- strings.pot	  - originální soubor textů z hry
- preview.jpg	  - ikona módu
- transform	  - linux skript pro nastavení formátu souboru překladu, generuje czech_ascii.po ve složce czechlanguage
- czechlanguage/ - složka dat módu, připraveno k použití, neupravovat až na *.lua
 - czech.po		- kopie czech.po z nadřazené složky
 - czech_ascii.po	- soubor czech.po ve formátu ASCII s nakonfigurovanými parametry, generovaný skriptem transform
 - modinfo.lua		- nastavení módu
 - modmain.lua		- soubor překladu k načtení

POUŽITÍ/INSTALACE MÓDU
----------------------
- Pro použití módu ve hře je možné stáhnout repozitář kliknutím na tlačítko Download ZIP vpravo.
- Jako mód se používá složka czechlanguage s jejím obsahem.<br />
(Složka módu se vloží standardně přímo do adresáře mods hry Don't Starve.)

PŘEKLAD
-------
Máte-li zájem o překlad, upravujte soubor czech.po v kořenovém adresáři repozitáře.<br />
Pokud máte možnost, použijte skript transform pro vygenerování souboru czech_ascii.po.

POZNÁMKA
--------
V současné chvíli hra Don't Starve nepodporuje kódování UTF-8. Z toho důvodu překlad probíhá dočasně ve dvou fázích.
 - Běžně se překládá soubor czech.po, který je v kódování UTF-8 a obsahuje překlad s diakritikou. To umožní okamžitou podporu diakritiky v okamžiku podpory tohoto kódování ve hře pouhým přepsáním hodnoty v souboru modmain.lua.
 - Dočasně se používá skript transform, který soubor czech.po upraví do czech_ascii.po tak, že mu přenastaví kódování na iso-8859-2, zruší diakritiku a správně ho nakonfiguruje.
Soubor czech_ascii.po je proto zatím ten, který je ve hře použit (nastavením v souboru modinfo.lua).

