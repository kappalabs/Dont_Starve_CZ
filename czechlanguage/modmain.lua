-- Nacteni upravenych textur do hry.
Assets = {
	Asset("ATLAS", "bigportraits/locked.xml"),
	Asset("IMAGE", "bigportraits/locked.tex"),

	Asset("ATLAS", "images/customisation.xml"),
	Asset("IMAGE", "images/customisation.tex"),
}

-- Data pro feature menici preklady za originaly
table.insert(GLOBAL.STRINGS, "CZT_MARK")
GLOBAL.STRINGS.CZT_MARK = "-#&#-"
-- Klavesa zamenujici preklad za original - konfigurovatelne
table.insert(GLOBAL.STRINGS, "CZT_SWAP_KEY")
GLOBAL.STRINGS.CZT_SWAP_KEY = GLOBAL.KEY_C

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

LoadPOFile("czech.po", "CS")
-- LoadPOFile("czech_ascii.po", "CS")

-- Informace o tvorbe prekladu: http://forums.kleientertainment.com/index.php?/topic/10292-creating-a-translation-using-the-po-format/

io=GLOBAL.io
STRINGS=GLOBAL.STRINGS
tonumber=GLOBAL.tonumber
tostring=GLOBAL.tostring
assert=GLOBAL.assert

-- Funkce pro nacteni a nastaveni ceskych fontu
function ApplyCzechFonts()
	-- Jmena souboru fontu, ktere budou nacteny
	local CzFontFiles={
        "belisaplumilla50__cz.zip",   -- 1 - bp50
				"belisaplumilla100__cz.zip",  -- 2 - bp100
        "buttonfont__cz.zip",         -- 3 - buttonfont
        "opensans50__cz.zip",         -- 4 - opensans
        "stint-ucr20__cz.zip",        -- 5 - stint-small
				"stint-ucr50__cz.zip",        -- 6 - stint-ucr
        "talkingfont__cz.zip",        -- 7 - talkingfont
        "talkingfont_wathgrithr.zip", -- 8 - talkingfont_warthgrithr
  }

	-- Odnacteni vsech originalnich fontu hry --
  --------------------------------------------
	GLOBAL.DEFAULTFONT = "opensans"
	GLOBAL.DIALOGFONT = "opensans"
	GLOBAL.TITLEFONT = "bp100"
	GLOBAL.UIFONT = "bp50"
	GLOBAL.BUTTONFONT="buttonfont"
	GLOBAL.NUMBERFONT = "stint-ucr"
	GLOBAL.TALKINGFONT = "talkingfont"
	GLOBAL.TALKINGFONT_WATHGRITHR = "talkingfont_wathgrithr"
	GLOBAL.SMALLNUMBERFONT = "stint-small"
	GLOBAL.BODYTEXTFONT = "stint-ucr"
  
	-- Odnacteni jednotlivych ceskych fontu
	for i,FileName in ipairs(CzFontFiles) do
		GLOBAL.TheSim:UnloadFont("czfont"..tostring(i))
	end
	GLOBAL.TheSim:UnloadPrefabs({"czfonts"})
  
  
	-- Nastaveni novych/ceskych fontu --
  ------------------------------------
  
	local CzFontsAssets={}
	for i,FileName in ipairs(CzFontFiles) do 
		table.insert(CzFontsAssets, GLOBAL.Asset("FONT", MODROOT.."fonts/"..FileName))
	end

	-- Vytvoreni Prefab a jeho registrace
	local CzFontsPrefab=GLOBAL.Prefab("common/czfonts", nil, CzFontsAssets)
	GLOBAL.RegisterPrefabs(CzFontsPrefab)
	GLOBAL.TheSim:LoadPrefabs({"czfonts"})

	-- Nacteni jednotlivych souboru fontu
	for i,FileName in ipairs(CzFontFiles) do
		GLOBAL.TheSim:LoadFont(MODROOT.."fonts/"..FileName, "czfont"..tostring(i))
	end

	-- Vlozeni aliasu do globalnich promennych
	GLOBAL.DEFAULTFONT  = "czfont4" -- opensans
	GLOBAL.DIALOGFONT   = "czfont4" -- opensans
	GLOBAL.TITLEFONT    = "czfont2" -- bp100
	GLOBAL.UIFONT       = "czfont1" -- bp50
	GLOBAL.BUTTONFONT   = "czfont3" -- buttonfont
	GLOBAL.NUMBERFONT   = "czfont6" -- stint-ucr
	GLOBAL.TALKINGFONT  = "czfont7" -- talkingfont
	GLOBAL.TALKINGFONT_WATHGRITHR = "czfont8" -- talkingfont_wathgrithr
	GLOBAL.SMALLNUMBERFONT = "czfont5"  -- stint-small
	GLOBAL.BODYTEXTFONT = "czfont6"     -- stint-ucr

	GLOBAL.TheSim:UnloadPrefabs({"czfonts"})
--	GLOBAL.TheSim:UnloadPrefabs({"czfonts"})
end

function ApplyCzechFontsRewrite()
	-- Jmena souboru fontu, ktere budou nacteny
	local CzFontFiles={
        "belisaplumilla50__cz.zip",   -- 1 - bp50
				"belisaplumilla100__cz.zip",  -- 2 - bp100
        "buttonfont__cz.zip",         -- 3 - buttonfont
        "opensans50__cz.zip",         -- 4 - opensans
        "stint-ucr20__cz.zip",        -- 5 - stint-small
				"stint-ucr50__cz.zip",        -- 6 - stint-ucr
        "talkingfont__cz.zip",        -- 7 - talkingfont
        "talkingfont_wathgrithr.zip", -- 8 - talkingfont_warthgrithr
  }
  -- Funkce pro prepsani souboru
	local function copyfile(source,dest)
		local f = assert(io.open(source,"rb"))
		local content = f:read("*all")
		f:close()
		f = assert(io.open(dest,"w"))
		f:write(content)
		f:close()
	end
  -- Prepsani jednotlivych fontu hry
	for i,FileName in ipairs(CzFontFiles) do
    local orig = FileName:gsub("__cz", "");
    copyfile(MODROOT.."/fonts/"..FileName,"fonts/"..orig);
	end
end

-- nefunkcni postup?
--local UPDATENAME=GLOBAL.STRINGS.UI.MAINSCREEN.UPDATENAME
--GLOBAL.LanguageTranslator.languages["CS"]["STRINGS.UI.MAINSCREEN.UPDATENAME"]=UPDATENAME
--GLOBAL.TranslateStringTable(GLOBAL.STRINGS)
-- ApplyCzechFonts()

-- Nastavi ceske fonty prepsanim originalnich souboru
ApplyCzechFontsRewrite()
