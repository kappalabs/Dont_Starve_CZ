-- Nacteni upravenych textur do hry.
Assets = {
	Asset("ATLAS", "bigportraits/locked.xml"),
	Asset("IMAGE", "bigportraits/locked.tex"),

	Asset("ATLAS", "images/customisation.xml"),
	Asset("IMAGE", "images/customisation.tex"),

--	Asset("ATLAS", "images/ui.xml"),
--	Asset("IMAGE", "images/ui.tex"),
}

-- V okamziku podpory formatovani UTF-8 odkomentovat prvni a zakomentovat druhou metodu LoadPOFile

-- LoadPOFile("czech.po", "CS")
LoadPOFile("czech_ascii.po", "CS")

-- Informace o tvorbe prekladu: http://forums.kleientertainment.com/index.php?/topic/10292-creating-a-translation-using-the-po-format/
