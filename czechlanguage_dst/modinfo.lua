name = "Czech Language Pack"
id = "czechlanguagepack"
version = "0.1.1"
desc = {en = "Czech translation of the game.\n\nVersion: "..version,
		    cz = "\nBalíček s češtinou do hry.\n\nVerze: "..version}
description = desc[language] or desc["en"]
author = "Kappa, KeeBLeeC & Relred"

forumthread = ""

api_version = 10
priority = 1

-- DS Together compatibility settings
dont_starve_compatible = true
dst_compatible = true
all_clients_require_mod = false
client_only_mod = true
server_filter_tags = {"czech"}

-- Icon for the mod
icon_atlas = "czechlanguage.xml"
icon = "czechlanguage.tex"

