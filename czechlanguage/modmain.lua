GLOBAL.setmetatable(env, {__index=GLOBAL})
	
-- Nacteni upravenych textur do hry.
Assets = {
	Asset("ATLAS", "bigportraits/locked.xml"),
	Asset("IMAGE", "bigportraits/locked.tex"),

	Asset("ATLAS", "images/customisation.xml"),
	Asset("IMAGE", "images/customisation.tex"),
}

-- Data pro feature menici preklady za originaly
table.insert(STRINGS, "CZT_MARK")
STRINGS.CZT_MARK = "-#&#-"
-- Klavesa zamenujici preklad za original - konfigurovatelne
table.insert(STRINGS, "CZT_SWAP_KEY")
STRINGS.CZT_SWAP_KEY = KEY_C

-- Pokud hrac pouziva DisplayFoodValues
table.insert(STRINGS, "DFV_LANG")
table.insert(STRINGS, "DFV_HUNGER")
table.insert(STRINGS, "DFV_HEALTH")
table.insert(STRINGS, "DFV_SANITY")
table.insert(STRINGS, "DFV_SPOILSOON")
table.insert(STRINGS, "DFV_SPOILIN")
table.insert(STRINGS, "DFV_SPOILDAY")

STRINGS.DFV_LANG = "CS"
STRINGS.DFV_HUNGER = "Hlad"
STRINGS.DFV_HEALTH = "Zdravi"
STRINGS.DFV_SANITY = "Pricetnost"
STRINGS.DFV_SPOILSOON = "Brzy se zkazi"
STRINGS.DFV_SPOILIN = "Zkazi se za"
STRINGS.DFV_SPOILDAY = "dny. Sss"

-- V okamziku podpory ceskeho fontu odkomentovat prvni a zakomentovat druhou metodu LoadPOFile

LoadPOFile("czech.po", "CS")
-- LoadPOFile("czech_ascii.po", "CS")

-- Informace o tvorbe prekladu: http://forums.kleientertainment.com/index.php?/topic/10292-creating-a-translation-using-the-po-format/

io=io
STRINGS=STRINGS
tonumber=tonumber
tostring=tostring
assert=assert

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
	DEFAULTFONT = "opensans"
	DIALOGFONT = "opensans"
	TITLEFONT = "bp100"
	UIFONT = "bp50"
	BUTTONFONT="buttonfont"
	NUMBERFONT = "stint-ucr"
	TALKINGFONT = "talkingfont"
	TALKINGFONT_WATHGRITHR = "talkingfont_wathgrithr"
	SMALLNUMBERFONT = "stint-small"
	BODYTEXTFONT = "stint-ucr"
  
	-- Odnacteni jednotlivych ceskych fontu
	for i,FileName in ipairs(CzFontFiles) do
		TheSim:UnloadFont("czfont"..tostring(i))
	end
	TheSim:UnloadPrefabs({"czfonts"})
  
  
	-- Nastaveni novych/ceskych fontu --
  ------------------------------------
  
	local CzFontsAssets={}
	for i,FileName in ipairs(CzFontFiles) do 
		table.insert(CzFontsAssets, Asset("FONT", MODROOT.."fonts/"..FileName))
	end

	-- Vytvoreni Prefab a jeho registrace
	local CzFontsPrefab=Prefab("common/czfonts", nil, CzFontsAssets)
	RegisterPrefabs(CzFontsPrefab)
	TheSim:LoadPrefabs({"czfonts"})

	-- Nacteni jednotlivych souboru fontu
	for i,FileName in ipairs(CzFontFiles) do
		TheSim:LoadFont(MODROOT.."fonts/"..FileName, "czfont"..tostring(i))
	end

	-- Vlozeni aliasu do globalnich promennych
	DEFAULTFONT  = "czfont4" -- opensans
	DIALOGFONT   = "czfont4" -- opensans
	TITLEFONT    = "czfont2" -- bp100
	UIFONT       = "czfont1" -- bp50
	BUTTONFONT   = "czfont3" -- buttonfont
	NUMBERFONT   = "czfont6" -- stint-ucr
	TALKINGFONT  = "czfont7" -- talkingfont
	TALKINGFONT_WATHGRITHR = "czfont8" -- talkingfont_wathgrithr
	SMALLNUMBERFONT = "czfont5"  -- stint-small
	BODYTEXTFONT = "czfont6"     -- stint-ucr

	TheSim:UnloadPrefabs({"czfonts"})
--	TheSim:UnloadPrefabs({"czfonts"})
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
    copyfile(MODROOT.."fonts/"..FileName,"fonts/"..orig);
	end
end

-- nefunkcni postup?
--local UPDATENAME=STRINGS.UI.MAINSCREEN.UPDATENAME
--LanguageTranslator.languages["CS"]["STRINGS.UI.MAINSCREEN.UPDATENAME"]=UPDATENAME
--TranslateStringTable(STRINGS)
-- ApplyCzechFonts()

-- Nastavi ceske fonty prepsanim originalnich souboru
ApplyCzechFontsRewrite()
