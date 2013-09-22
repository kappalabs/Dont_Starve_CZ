-- Nacteni upravenych textur do hry.
Assets = {
	Asset("ATLAS", "bigportraits/locked.xml"),
	Asset("IMAGE", "bigportraits/locked.tex"),

	Asset("ATLAS", "images/customisation.xml"),
	Asset("IMAGE", "images/customisation.tex"),

--	Asset("ATLAS", "images/ui.xml"),
--	Asset("IMAGE", "images/ui.tex"),
}

-- Data pro feature menici preklady za originaly
table.insert(GLOBAL.STRINGS, "CZT_MARK")
GLOBAL.STRINGS.CZT_MARK = "-#&#-"

-- Pokud hrac pouziva DisplayFoodValues
table.insert(GLOBAL.STRINGS, "DFV_LANG")
table.insert(GLOBAL.STRINGS, "DFV_HUNGER")
table.insert(GLOBAL.STRINGS, "DFV_HEALTH")
table.insert(GLOBAL.STRINGS, "DFV_SANITY")
table.insert(GLOBAL.STRINGS, "DFV_SPOILSOON")
table.insert(GLOBAL.STRINGS, "DFV_SPOILIN")
table.insert(GLOBAL.STRINGS, "DFV_SPOILDAY")

GLOBAL.STRINGS.DFV_LANG = "CS"
GLOBAL.STRINGS.DFV_HUNGER = "Hlad"
GLOBAL.STRINGS.DFV_HEALTH = "Zdravi"
GLOBAL.STRINGS.DFV_SANITY = "Pricetnost"
GLOBAL.STRINGS.DFV_SPOILSOON = "Brzy se zkazi"
GLOBAL.STRINGS.DFV_SPOILIN = "Zkazi se za"
GLOBAL.STRINGS.DFV_SPOILDAY = "dny. Sss"

-- V okamziku podpory ceskeho fontu odkomentovat prvni a zakomentovat druhou metodu LoadPOFile

-- LoadPOFile("czech.po", "CS")
LoadPOFile("czech_ascii.po", "CS")

-- Informace o tvorbe prekladu: http://forums.kleientertainment.com/index.php?/topic/10292-creating-a-translation-using-the-po-format/
