Don't Starve CZ (DS+RoG+SW 42%, DST 39%)
========================================
**Czech translation mod for Don't Starve + RoG + SW + HAM [Update 5500621 4. 9. 2020] & DS Together [Update 201210 21. 12. 2016]**<br />
**Mód českého překladu hry Don't Starve + RoG + SW + HAM [Update 5500621 4. 9. 2020] & DS Together [Update 201210 21. 12. 2016]**

POPIS MÓDŮ
----------
<!--- - Mód obsahuje **úplný překlad** celého obsahu základní verze hry. --->
- první z módů je určen pouze pro Don't Starve s podporou datadisků Shipwrecked i Reign of Giants, druhý mód je určen pouze pro Don't Starve Together
- Oba módy v současnosti obsahují **neúplný překlad** obsahu textů ve hře.
- **Mód pro DS obsahuje možnost zobrazení všech originálních názvů** po stisku konfigurovatelné klávesy, **v defaultu "c"**.
- Z důvodu implementace této možnosti a její neslučitelnosti s módem DisplayFoodValues bylo zváženo a provedeno **implementování módu DisplayFoodValues od módera alks** do českého balíčku, jako bonus, včetně podpory českého skloňování.
- Mód do DS obsahuje české fonty, umožňuje tedy zobrazení textů včetně diakritiky.
- Mód pro DST v tuto chvíli diakritiku nepodporuje.

POUŽITÍ/INSTALACE MÓDŮ
----------------------
- Pro použití módu ve hře je možné stáhnout repozitář kliknutím na tlačítko Download ZIP vpravo.
- Jako mód do DS se používá složka czechlanguage s jejím obsahem, obdobně do DST použij složku czechlanguage_dst.<br />
(Složka módu se vloží standardně přímo do adresáře mods hry Don't Starve.)<br />
- Máte-li instalovaný tento mód ze zdroje Steam Workshop, věnujte pozornost aktivaci správné verze tohoto módu.

POUŽITÍ FONTŮ
-------------
- Mód do DS přepisuje originální soubory fontů hry
- Originální soubory fontů hry jsou zálohovány do složky fonts\_orig_backup, která se nachází v adresáři tohoto módu

PŘEKLAD
-------
Máte-li zájem o překlad, upravujte soubory czech.po (pro DS+SW+RoG), nebo czech_dst.po (pro DST) v kořenovém adresáři repozitáře, vytvořte vlastní větev repozitáře, budu je sám slučovat do hlavní větve master.<br />
Pro překlad prosím použij [PoEdit](http://www.poedit.net/), přelož nejdříve malou část a tu nám zašli k ohodnocení.<br />
Skript transform slouží pro vygenerování souboru czech_ascii.po a czech.po v adresáři czechlanguage/.<br />
Nemáte-li s Git zkušenosti, stačí stáhnout repozitář (jak je popsáno výše), upravit soubor .po (z kořenového adresáře!) a zaslat mi ho na email, který najdete v mém GitHub profilu.

SOUBORY
-------
- **czech.po - soubor aktuálních překladů DS+RoG+SW z EN do CZ** (upravovat lze efektivně v [PoEdit](http://www.poedit.net/))
- **czech_dst.po - soubor aktuálních překladů DST z EN do CZ**
- strings.pot - originální soubor textů z aktuální verze hry DS a datadisků
- strings_dst.pot - originální soubor textů z aktuální verze hry DST
- preview.jpg - ikona módu
- transform.sh - bash skript pro nastavení formátu souborů překladu, generuje czech.po a czech_ascii.po ve složce czechlanguage a czechlanguage\_dst, připraví do těchto souborů také dvojité texty pro herní featuru, která umožňuje zobrazení originálních názvů, využívá při tom program **Uprav.java**
- Uprav.java - Java program pro úpravu formátu souboru czech_ascii.po pro featuru záměny překladů za originál
- czechlanguage/ - složka dat módu pro DS, připraveno k použití jako mód, neupravovat - upravuje automaticky transform.sh
 - czech.po - soubor czech.po z nadřazené složky v kódování **ISO-8859-2**, navíc modifikovaný pro herní featuru, generovaný **transform.sh**
 - czech_ascii.po - soubor czech.po v kódování **ASCII** (bez diakritiky) s nakonfigurovanými parametry, generovaný skriptem **transform.sh**
 - modinfo.lua - obecné nastavení módu
 - modmain.lua - nastavení souboru překladu k načtení do módu atp.
- czechlanguage_dst/ - složka dat módu pro DST, připraveno k použití jako mód, neupravovat - upravuje automaticky transform.sh
- resources/ - složka obsahující .xfc soubory z programu Gimp 2.8.4, jedná se projekty pře(psaných|ložených) obrázků, dále také zdrojové soubory pro vytvoření českých fontů do hry

TODO
----
- dopřeklad DLC RoG, SW, HAM a DST

ZÁSLUHY
-------
- **Programátor: Vojtěch Vašek** (Kappa) - [fojjta.cekuj.net](http://www.fojjta.cekuj.net/)
- **Překladatel: Jan Rýgl** (KeeBLeeC) - [RIASolution.eu](http://www.riasolution.eu/)

