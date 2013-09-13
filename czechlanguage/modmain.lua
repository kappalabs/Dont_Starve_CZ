-- Nacteni upravenych textur do hry.
Assets = {
	Asset("ATLAS", "bigportraits/locked.xml"),
	Asset("IMAGE", "bigportraits/locked.tex"),

	Asset("ATLAS", "images/customisation.xml"),
	Asset("IMAGE", "images/customisation.tex"),

--	Asset("ATLAS", "images/ui.xml"),
--	Asset("IMAGE", "images/ui.tex"),
}

GLOBAL.STRINGS.DFV_LANG = "CS"
GLOBAL.STRINGS.DFV_HUNGER = "Hlad"
GLOBAL.STRINGS.DFV_HEALTH = "Zdravi"
GLOBAL.STRINGS.DFV_SANITY = "Pricetnost"
GLOBAL.STRINGS.DFV_SPOILSOON = "Brzy se zkazi"
GLOBAL.STRINGS.DFV_SPOILIN = "Zkazi se za"
GLOBAL.STRINGS.DFV_SPOILDAY = "dny. Sss"

-- V okamziku podpory formatovani UTF-8 odkomentovat prvni a zakomentovat druhou metodu LoadPOFile

-- LoadPOFile("czech.po", "CS")
LoadPOFile("czech_ascii.po", "CS")

-- Informace o tvorbe prekladu: http://forums.kleientertainment.com/index.php?/topic/10292-creating-a-translation-using-the-po-format/
