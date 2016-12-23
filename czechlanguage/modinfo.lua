
name = "Czech Language Pack"
id = "czechlanguagepack"
version = "2.3.1"
desc = {en = "Czech translation of the game.\n\nVersion: "..version,
		    cz = "\nBalíček s češtinou do hry.\n\nVerze: "..version}
description = desc[language] or desc["en"]
author = "Kappa, KeeBLeeC & Relred"

-- http://forums.kleientertainment.com/index.php?/files/file/202-sample-mods/
-- <-- /files/file/202-sample-mods/
forumthread = "/files/file/202-sample-mods/"

api_version = 6
priority = 5
dont_starve_compatible = true
reign_of_giants_compatible = true
shipwrecked_compatible = true

-- DS Together compatibility settings
--dst_compatible = true
--all_clients_require_mod = false
--client_only_mod = true
--server_filter_tags = {"czech"}

-- For images to reload safely
restart_required = true

-- Icon for the mod
icon_atlas = "czechlanguage.xml"
icon = "czechlanguage.tex"

