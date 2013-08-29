Dont_Starve_CZ
==============

Czech translation mod for Don't Starve
Mód českého překladu hry Don't Starve

SOUBORY
-------
czech.po	  - soubor aktuálnních překladů EN do CZ
czech_ascii.po	  - soubor czech.po ve formátu ASCII s nakonfigurovanými parametry
strings.pot	  - originální soubor textů z hry
preview.jpg	  - ikona módu
czechlanguage.zip - automaticky generovaný balíček připravený pro hru Don't Starve
transform	  - linux skript pro nastavení formátu souboru překladu

POUŽITÍ
-------
Pro použití módu ve hře je možné stáhnout celý projekt kliknutím na tlačítko Download ZIP vpravo, nebo je možné stáhnout soubor czechlanguage.zip v projektu.

PŘEKLAD
-------
Máte-li zájem o překlad, upravujte soubor czech.po.
Pokud máte možnost, použijte skript transform pro vygenerování souboru czech_ascii.po.

POZNÁMKA
--------
V současné chvíli hra Don't Starve nepodporuje kódování UTF-8. Z toho důvodu překlad probíhá dočasně ve dvou fázích.
 - Běžně se překládá soubor czech.po, který je v kódování UTF-8 a obsahuje překlad s diakritikou. To umožní okamžitou podporu diakritiky v okamžiku podpory tohoto kódování ve hře.
 - Dočasně se používá skript transform, který soubor czech.po upraví do czech_ascii.po tak, že mu přenastaví kódování na iso-8859-2, zruší diakritiku a správně ho nakonfiguruje.
Soubor czech_ascii.po je proto zatím ten, který je ve hře použit (nastavením v souboru modinfo.lua).

