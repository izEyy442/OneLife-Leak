Configcore_nui = {}


Configcore_nui.status = {
    StatusMax = 1000000,
    TickTime = 1750,
    UpdateInterval = 30000
}

Configcore_nui.trashlist = {
    "prop_snow_bin_01",
    "prop_snow_dumpster_01",
    "prop_snow_bin_02",
    "prop_dumpster_4a",
    "prop_bin_05a",
    "prop_bin_01a",
    "prop_dumpster_02b",
    "prop_bin_12a",
    "prop_bin_08a",
    "prop_bin_06a",
    "prop_bin_02a",
    "prop_dumpster_01a",
    "prop_dumpster_02a",
    "prop_cs_bin_02",
    "prop_bin_07b",
    "prop_bin_07c",
    "prop_bin_07a",
    "prop_bin_03a",
    "prop_bin_08open",
    "prop_bin_delpiero_b",
    "prop_bin_delpiero",
    "prop_bin_04a",
    "prop_bin_09a",
    "prop_dumpster_3a",
    "prop_dumpster_4b",
    "sc1_07_clinical_bin",
    "prop_gas_binunit01",
    "prop_bin_14a",
    "prop_cs_dumpster_01a",
    "v_serv_waste_bin1",
    "prop_bin_11b",
    "prop_bin_10a",
    "prop_bin_beach_01a",
    "prop_bin_11a",
    "prop_bin_13a",
    "prop_bin_beach_01d",
    "prop_bin_10b",
    "prop_bin_14b",
    "prop_cs_bin_01",
    "prop_cs_bin_03",
    "v_ret_gc_bin",
    "v_ret_csr_bin",
    "v_med_bin",
    "mp_b_kit_bin_01",
    "hei_heist_kit_bin_01",
    "ch_prop_casino_bin_01a",
    "vw_prop_vw_casino_bin_01a",
    "prop_recyclebin_01a",
    "prop_recyclebin_04_a",
    "prop_recyclebin_04_b",
    "prop_recyclebin_05_a",
    "prop_recyclebin_02b",
    "prop_recyclebin_02a",
    "prop_recyclebin_02_d",
    "prop_recyclebin_02_c",
}

Configcore_nui.filterItem = {
    weapons = {
        -- Melee
        "weapon_dagger",
        "weapon_bat",
        "weapon_bottle",
        "weapon_crowbar",
        "weapon_flashlight",
        "weapon_golfclub",
        "weapon_hammer",
        "weapon_hatchet",
        "weapon_knuckle",
        "weapon_knife",
        "weapon_machete",
        "weapon_switchblade",
        "weapon_nightstick",
        "weapon_wrench",
        "weapon_battleaxe",
        "weapon_poolcue",
        "weapon_stone_hatchet",
        "weapon_candycane",

        --Handguns
        "weapon_pistol",
        "weapon_pistol_mk2",
        "weapon_combatpistol",
        "weapon_appistol",
        "weapon_stungun",
        "weapon_pistol50",
        "weapon_snspistol",
        "weapon_snspistol_mk2",
        "weapon_heavypistol",
        "weapon_vintagepistol",
        "weapon_flaregun",
        "weapon_marksmanpistol",
        "weapon_revolver",
        "weapon_revolver_mk2",
        "weapon_doubleaction",
        "weapon_raypistol",
        "weapon_ceramicpistol",
        "weapon_navyrevolver",
        "weapon_gadgetpistol",
        "weapon_stungun_mp",
        "weapon_pistolxm3",

        -- Submachine Guns       
        "weapon_microsmg",
        "weapon_smg",
        "weapon_smg_mk2",
        "weapon_assaultsmg",
        "weapon_combatpdw",
        "weapon_machinepistol",
        "weapon_minismg",
        "weapon_raycarbine",
        "weapon_tecpistol",

        -- Shotguns
        "weapon_pumpshotgun",
        "weapon_pumpshotgun_mk2",
        "weapon_sawnoffshotgun",
        "weapon_assaultshotgun",
        "weapon_bullpupshotgun",
        "weapon_musket",
        "weapon_heavyshotgun",
        "weapon_dbshotgun",
        "weapon_autoshotgun",
        "weapon_combatshotgun",

        -- Assault Rifles
        "weapon_assaultrifle",
        "weapon_assaultrifle_mk2",
        "weapon_carbinerifle",
        "weapon_carbinerifle_mk2",
        "weapon_advancedrifle",
        "weapon_specialcarbine",
        "weapon_specialcarbine_mk2",
        "weapon_bullpuprifle",
        "weapon_bullpuprifle_mk2",
        "weapon_compactrifle",
        "weapon_militaryrifle",
        "weapon_heavyrifle",
        "weapon_tacticalrifle",

        -- Light Machine Guns
        "weapon_mg",
        "weapon_combatmg",
        "weapon_combatmg_mk2",
        "weapon_gusenberg",

        -- Sniper Rifles
        "weapon_sniperrifle",
        "weapon_heavysniper",
        "weapon_heavysniper_mk2",
        "weapon_marksmanrifle",
        "weapon_marksmanrifle_mk2",
        "weapon_precisionrifle",

        -- Heavy Weapons
        "weapon_rpg",
        "weapon_grenadelauncher",
        "weapon_grenadelauncher_smoke",
        "weapon_minigun",
        "weapon_firework",
        "weapon_railgun",
        "weapon_hominglauncher",
        "weapon_compactlauncher",
        "weapon_rayminigun",
        "weapon_emplauncher",
        "weapon_railgunxm3",

        -- Throwables
        "weapon_grenade",
        "weapon_bzgas",
        "weapon_molotov",
        "weapon_stickybomb",
        "weapon_proxmine",
        "weapon_snowball",
        "weapon_pipebomb",
        "weapon_ball",
        "weapon_smokegrenade",
        "weapon_flare",
        "weapon_acidpackage",

        -- add-on
        "weapon_fragile",
        "weapon_penis",
        "weapon_wolfknife",
        "weapon_specialhammer",
        "weapon_maze",
        -- new
        "wepaon_scar17",

    },

    throwables = {
        [GetHashKey("weapon_grenade")] = true,
        [GetHashKey("weapon_bzgas")] = true,
        [GetHashKey("weapon_molotov")] = true,
        [GetHashKey("weapon_stickybomb")] = true,
        [GetHashKey("weapon_proxmine")] = true,
        [GetHashKey("weapon_snowball")] = true,
        [GetHashKey("weapon_pipebomb")] = true,
        [GetHashKey("weapon_ball")] = true,
    },

    foods = {
        "burgerclassique",
        "frites",
        "bread",
        "coffe",
        "donuts",
        "bolnoixcajou",
        "bolpistache",
        "water",
        "vine",
        "chocolat",
        "applepie",
        "bolchips",
        "bolcacahuetes",
        "banana",
        "beef",
        "hamburger",
        "cupcake",
        "soda",
        "caprisun",
        "jusfruit",
        "mixapero",
        "mojito",
        "limonade",
        "fanta",
        "icetea",
        "cocacola",
        "orangina",
        "cola",
        "coca",
        "raisin",
        "loka",
        "pizza",
        "cacahuete",
        "olive",
        "ice",
        "icetea",
        "wiskycoca",
        "fish",
        "energy",
        "chips",
        "sandwich",
        "tpoulet",
    },
    clothes = {

    }
}


Configcore_nui.permanentWeapons = {
    -- "WEAPON_SWITCHBLADE",
    "WEAPON_BATTLEAXE",
    -- "WEAPON_WRENCH",
    -- "WEAPON_DAGGER",
    "WEAPON_KARAMBIT",
    "WEAPON_LUCILE",
    -- "WEAPON_TRIDAGGER",
    "WEAPON_PAN",
    "WEAPON_BAYONET",
    "WEAPON_KATANA_4",
    "WEAPON_KATANA4",
    "WEAPON_KATANA3",
    -- "WEAPON_FLASHLIGHT",
    -- "WEAPON_NIGHTSTICK",
    -- "WEAPON_PUMPSHOTGUN",
    "WEAPON_KATANA2",
    "WEAPON_KATANA",
    "WEAPON_SNSPISTOL_MK2",
    "WEAPON_PISTOL_MK2",
    -- "WEAPON_BEANBAG",
    "WEAPON_APPISTOL",
    "WEAPON_MACHINEPISTOL",
    -- "WEAPON_COMBATPISTOL",
    -- "WEAPON_CARBINERIFLE",
    -- "WEAPON_STUNGUN",
    "WEAPON_SMG",
    "WEAPON_ADVANCEDRIFLE",
    -- "WEAPON_MUSKET",
    "WEAPON_DOUBLEACTION",
    "WEAPON_ASSAULTRIFLE", 
    "WEAPON_GUSENBERG",
    "WEAPON_FRAGILE",
    "WEAPON_PENIS",
    "WEAPON_WOLFKNIFE",
    "WEAPON_SPECIALHAMMER",
    "WEAPON_MAZE",
    "WEAPON_SCAR17",
    "WEAPON_TEC9M",
}


Configcore_nui.VehiculeMaxWeight = {
    --MOTOS    
    [GetHashKey("akuma")] = 10.0,
    [GetHashKey("avarus")] = 10.0,
    [GetHashKey("bagger")] = 10.0,
    [GetHashKey("bati")] = 10.0,
    [GetHashKey("bati2")] = 10.0,
    [GetHashKey("bf400")] = 10.0,
    [GetHashKey("carbonrs")] = 10.0,
    [GetHashKey("chimera")] = 10.0,
    [GetHashKey("cliffhanger")] = 10.0,
    [GetHashKey("daemon")] = 10.0,
    [GetHashKey("daemon2")] = 10.0,
    [GetHashKey("defiler")] = 10.0,
    [GetHashKey("deathbike")] = 10.0,
    [GetHashKey("diablous")] = 10.0,
    [GetHashKey("diablous2")] = 10.0,
    [GetHashKey("double")] = 10.0,
    [GetHashKey("enduro")] = 10.0,
    [GetHashKey("esskey")] = 10.0,
    [GetHashKey("faggio")] = 10.0,
    [GetHashKey("faggio2")] = 10.0,
    [GetHashKey("faggio3")] = 10.0,
    [GetHashKey("fcr")] = 10.0,
    [GetHashKey("fcr2")] = 10.0,
    [GetHashKey("gargoyle")] = 10.0,
    [GetHashKey("hakuchou")] = 10.0,
    [GetHashKey("hakuchou2")] = 10.0,
    [GetHashKey("hexer")] = 10.0,
    [GetHashKey("innovation")] = 10.0,
    [GetHashKey("lectro")] = 10.0,
    [GetHashKey("manchez")] = 10.0,
    [GetHashKey("nemesis")] = 10.0,
    [GetHashKey("nightblade")] = 10.0,
    [GetHashKey("ratbike")] = 10.0,
    [GetHashKey("ruffian")] = 10.0,
    [GetHashKey("rrocket")] = 10.0,
    [GetHashKey("sanchez")] = 10.0,
    [GetHashKey("sanchez2")] = 10.0,
    [GetHashKey("sanctus")] = 10.0,
    [GetHashKey("shotaro")] = 10.0,
    [GetHashKey("sovereign")] = 10.0,
    [GetHashKey("stryder")] = 10.0,
    [GetHashKey("thrust")] = 10.0,
    [GetHashKey("vader")] = 10.0,
    [GetHashKey("vindicator")] = 10.0,
    [GetHashKey("vortex")] = 10.0,
    [GetHashKey("wolfsbane")] = 10.0,
    [GetHashKey("zombiea")] = 10.0,
    [GetHashKey("zombieb")] = 10.0,
    [GetHashKey("manchez2")] = 10.0,
    [GetHashKey("shinobi")] = 10.0,
    [GetHashKey("blazer")] = 10.0,
    [GetHashKey("blazer2")] = 10.0,
    [GetHashKey("blazer3")] = 10.0,
    [GetHashKey("blazer4")] = 10.0,
    [GetHashKey("reever")] = 10.0,
    [GetHashKey("verus")] = 10.0,



    --SUV
    [GetHashKey("baller")] = 170.0,
    [GetHashKey("baller2")] = 170.0,
    [GetHashKey("baller3")] = 170.0,
    [GetHashKey("baller4")] = 170.0,
    [GetHashKey("baller5")] = 170.0,
    [GetHashKey("baller6")] = 170.0,
    [GetHashKey("bjxl")] = 170.0,
    [GetHashKey("cavalcade")] = 170.0,
    [GetHashKey("cavalcade2")] = 170.0,
    [GetHashKey("contender")] = 170.0,
    [GetHashKey("dubsta")] = 170.0,
    [GetHashKey("dubsta2")] = 170.0,
    [GetHashKey("fq2")] = 170.0,
    [GetHashKey("granger")] = 170.0,
    [GetHashKey("granger2")] = 170.0,
    [GetHashKey("gresley")] = 170.0,
    [GetHashKey("habanero")] = 170.0,
    [GetHashKey("huntley")] = 170.0,
    [GetHashKey("landstalker")] = 170.0,
    [GetHashKey("landstalker2")] = 170.0,
    [GetHashKey("mesa")] = 170.0,
    [GetHashKey("mesa2")] = 170.0,
    [GetHashKey("novak")] = 170.0,
    [GetHashKey("patriot")] = 170.0,
    [GetHashKey("patriot2")] = 170.0,
    [GetHashKey("radi")] = 170.0,
    [GetHashKey("rebla")] = 170.0,
    [GetHashKey("rocoto")] = 170.0,
    [GetHashKey("seminole")] = 170.0,
    [GetHashKey("seminole2")] = 170.0,
    [GetHashKey("serrano")] = 170.0,
    [GetHashKey("xls")] = 170.0,
    [GetHashKey("xls2")] = 170.0,
    [GetHashKey("squaddie")] = 170.0,
    [GetHashKey("baller7")] = 170.0,
    [GetHashKey("iwagen")] = 170.0,
    [GetHashKey("astron")] = 170.0,



    --COMPACT 
    [GetHashKey("brioso2")] = 60.0,
    [GetHashKey("asbo")] = 60.0,
    [GetHashKey("blista")] = 60.0,
    [GetHashKey("brioso")] = 60.0,
    [GetHashKey("club")] = 60.0,
    [GetHashKey("dilettante")] = 60.0,
    [GetHashKey("dilettante2")] = 60.0,
    [GetHashKey("issi2")] = 60.0,
    [GetHashKey("panto")] = 60.0,
    [GetHashKey("prairie")] = 60.0,
    [GetHashKey("rhapsody")] = 60.0,
    [GetHashKey("weevil")] = 60.0,
    [GetHashKey("brioso2")] = 60.0,



    --COUPES
    [GetHashKey("cogcabrio")] = 70.0,
    [GetHashKey("exemplar")] = 70.0,
    [GetHashKey("f620")] = 70.0,
    [GetHashKey("felon")] = 70.0,
    [GetHashKey("felon2")] = 70.0,
    [GetHashKey("jackal")] = 70.0,
    [GetHashKey("oracle")] = 70.0,
    [GetHashKey("oracle2")] = 70.0,
    [GetHashKey("sentinel")] = 70.0,
    [GetHashKey("sentinel2")] = 70.0,
    [GetHashKey("windsor")] = 70.0,
    [GetHashKey("windsor2")] = 70.0,
    [GetHashKey("zion2")] = 70.0,
    [GetHashKey("zion")] = 70.0,
    [GetHashKey("previon")] = 70.0,
    [GetHashKey("kanjosj")] = 70.0,
    [GetHashKey("postlude")] = 70.0,



    --MUSCLE
    [GetHashKey("blade")] = 45.0,
    [GetHashKey("buccaneer")] = 45.0,
    [GetHashKey("buccaneer2")] = 45.0,
    [GetHashKey("chino")] = 45.0,
    [GetHashKey("chino2")] = 45.0,
    [GetHashKey("clique")] = 45.0,
    [GetHashKey("coquette3")] = 45.0,
    [GetHashKey("deviant")] = 45.0,
    [GetHashKey("dominator")] = 45.0,
    [GetHashKey("dominator2")] = 45.0,
    [GetHashKey("dominator3")] = 45.0,
    [GetHashKey("dukes")] = 45.0,
    [GetHashKey("dukes3")] = 45.0,
    [GetHashKey("faction")] = 45.0,
    [GetHashKey("faction2")] = 45.0,
    [GetHashKey("faction3")] = 45.0,
    [GetHashKey("ellie")] = 45.0,
    [GetHashKey("gauntlet")] = 45.0,
    [GetHashKey("gauntlet2")] = 45.0,
    [GetHashKey("gauntlet3")] = 45.0,
    [GetHashKey("gauntlet4")] = 45.0,
    [GetHashKey("gauntlet5")] = 45.0,
    [GetHashKey("hermes")] = 45.0,
    [GetHashKey("hotknife")] = 45.0,
    [GetHashKey("hustler")] = 45.0,
    [GetHashKey("impaler")] = 45.0,
    [GetHashKey("impaler2")] = 45.0,
    [GetHashKey("impaler3")] = 45.0,
    [GetHashKey("impaler4")] = 45.0,
    [GetHashKey("imperator")] = 45.0,
    [GetHashKey("imperator2")] = 45.0,
    [GetHashKey("lurcher")] = 45.0,
    [GetHashKey("moonbeam")] = 45.0,
    [GetHashKey("moonbeam2")] = 45.0,
    [GetHashKey("peyote2")] = 45.0,
    [GetHashKey("phoenix")] = 45.0,
    [GetHashKey("picador")] = 45.0,
    [GetHashKey("ratloader")] = 45.0,
    [GetHashKey("ratloader2")] = 45.0,
    [GetHashKey("ruiner")] = 45.0,
    [GetHashKey("ruiner2")] = 45.0,
    [GetHashKey("ruiner3")] = 45.0,
    [GetHashKey("sabregt")] = 45.0,
    [GetHashKey("sabregt2")] = 45.0,
    [GetHashKey("slamvan")] = 45.0,
    [GetHashKey("slamvan2")] = 45.0,
    [GetHashKey("slamvan3")] = 45.0,
    [GetHashKey("slamvan4")] = 45.0,
    [GetHashKey("stalion")] = 45.0,
    [GetHashKey("stalion2")] = 45.0,
    [GetHashKey("tampa")] = 45.0,
    [GetHashKey("tampa3")] = 45.0,
    [GetHashKey("tulip")] = 45.0,
    [GetHashKey("vamos")] = 45.0,
    [GetHashKey("vigero")] = 45.0,
    [GetHashKey("virgo")] = 45.0,
    [GetHashKey("virgo2")] = 45.0,
    [GetHashKey("virgo3")] = 45.0,
    [GetHashKey("voodoo")] = 45.0,
    [GetHashKey("voodoo2")] = 45.0,
    [GetHashKey("yosemite")] = 45.0,
    [GetHashKey("yosemite2")] = 45.0,
    [GetHashKey("yosemite3")] = 45.0,
    [GetHashKey("dominator7")] = 45.0,
    [GetHashKey("weevil2")] = 45.0,
    [GetHashKey("vigero")] = 45.0,
    [GetHashKey("ruiner4")] = 45.0,
    [GetHashKey("greenwood")] = 45.0,
    [GetHashKey("buffalo4")] = 45.0,
    [GetHashKey("dominator7")] = 45.0,
    [GetHashKey("dominator7")] = 45.0,



    --OFFROAD 
    [GetHashKey("bfinjection")] = 90.0,
    [GetHashKey("bodhi2")] = 70.0,
    [GetHashKey("brawler")] = 50.0,
    [GetHashKey("caracara2")] = 70.0,
    [GetHashKey("dloader")] = 90.0,
    [GetHashKey("dubsta3")] = 90.0,
    [GetHashKey("dune")] = 20.0,
    [GetHashKey("everon")] = 45.0,
    [GetHashKey("freecrawler")] = 90.0,
    [GetHashKey("hellion")] = 90.0,
    [GetHashKey("kalahari")] = 45.0,
    [GetHashKey("kamacho")] = 150.0,
    [GetHashKey("mesa3")] = 70.0,
    [GetHashKey("outlaw")] = 30.0,
    [GetHashKey("rebel")] = 50.0,
    [GetHashKey("rebel2")] = 50.0,
    [GetHashKey("riata")] = 50.0,
    [GetHashKey("sandking")] = 50.0,
    [GetHashKey("sandking2")] = 65.0,
    [GetHashKey("trophytruck")] = 30.0,
    [GetHashKey("trophytruck2")] = 30.0,
    [GetHashKey("vagrant")] = 20.0,
    [GetHashKey("winky")] = 50.0,
    [GetHashKey("rancherxl")] = 90.0,
    [GetHashKey("patriot3")] = 70.0,
    [GetHashKey("draugur")] = 70.0,



    --SEDANS
    [GetHashKey("asea")] = 80.0,
    [GetHashKey("asterope")] = 80.0,
    [GetHashKey("cog55")] = 80.0,
    [GetHashKey("cog552")] = 80.0,
    [GetHashKey("cognoscenti")] = 80.0,
    [GetHashKey("emperor")] = 80.0,
    [GetHashKey("emperor2")] = 80.0,
    [GetHashKey("fugitive")] = 80.0,
    [GetHashKey("glendale")] = 80.0,
    [GetHashKey("glendale2")] = 80.0,
    [GetHashKey("ingot")] = 80.0,
    [GetHashKey("intruder")] = 80.0,
    [GetHashKey("premier")] = 80.0,
    [GetHashKey("primo")] = 80.0,
    [GetHashKey("primo2")] = 80.0,
    [GetHashKey("regina")] = 80.0,
    [GetHashKey("romero")] = 80.0,
    [GetHashKey("stafford")] = 80.0,
    [GetHashKey("stanier")] = 80.0,
    [GetHashKey("stratum")] = 80.0,
    [GetHashKey("stretch")] = 80.0,
    [GetHashKey("superd")] = 80.0,
    [GetHashKey("surge")] = 80.0,
    [GetHashKey("tailgater")] = 80.0,
    [GetHashKey("warrener")] = 80.0,
    [GetHashKey("washington")] = 80.0,
    [GetHashKey("tailgater2")] = 80.0,
    [GetHashKey("taxi")] = 80.0,
    [GetHashKey("cinquemila")] = 80.0,
    [GetHashKey("deity")] = 80.0,
    [GetHashKey("rhinehart")] = 80.0,



    --SPORTS
    [GetHashKey("alpha")] = 65.0,
    [GetHashKey("banshee")] = 65.0,
    [GetHashKey("bestiagts")] = 65.0,
    [GetHashKey("blista2")] = 65.0,
    [GetHashKey("blista3")] = 65.0,
    [GetHashKey("buffalo")] = 90.0,
    [GetHashKey("buffalo2")] = 90.0,
    [GetHashKey("buffalo3")] = 90.0,
    [GetHashKey("carbonizzare")] = 65.0,
    [GetHashKey("comet2")] = 65.0,
    [GetHashKey("comet3")] = 65.0,
    [GetHashKey("comet4")] = 65.0,
    [GetHashKey("comet5")] = 65.0,
    [GetHashKey("coquette")] = 65.0,
    [GetHashKey("coquette4")] = 65.0,
    [GetHashKey("drafter")] = 65.0,
    [GetHashKey("deveste")] = 65.0,
    [GetHashKey("elegy")] = 65.0,
    [GetHashKey("elegy2")] = 65.0,
    [GetHashKey("feltzer2")] = 65.0,
    [GetHashKey("flashgt")] = 65.0,
    [GetHashKey("furoregt")] = 65.0,
    [GetHashKey("fusilade")] = 65.0,
    [GetHashKey("futo")] = 65.0,
    [GetHashKey("gb650")] = 65.0,
    [GetHashKey("hotring")] = 65.0,
    [GetHashKey("komoda")] = 65.0,
    [GetHashKey("imorgon")] = 65.0,
    [GetHashKey("issi7")] = 65.0,
    [GetHashKey("italigto")] = 65.0,
    [GetHashKey("jugular")] = 90.0,
    [GetHashKey("jester")] = 65.0,
    [GetHashKey("jester2")] = 65.0,
    [GetHashKey("jester3")] = 65.0,
    [GetHashKey("khamelion")] = 65.0,
    [GetHashKey("kuruma")] = 65.0,
    [GetHashKey("locust")] = 65.0,
    [GetHashKey("lynx")] = 65.0,
    [GetHashKey("massacro")] = 65.0,
    [GetHashKey("massacro2")] = 65.0,
    [GetHashKey("neo")] = 65.0,
    [GetHashKey("neon")] = 65.0,
    [GetHashKey("ninef")] = 65.0,
    [GetHashKey("ninef2")] = 65.0,
    [GetHashKey("omnis")] = 65.0,
    [GetHashKey("paragon")] = 65.0,
    [GetHashKey("paragon2")] = 65.0,
    [GetHashKey("pariah")] = 65.0,
    [GetHashKey("penumbra")] = 65.0,
    [GetHashKey("penumbra2")] = 65.0,
    [GetHashKey("raiden")] = 65.0,
    [GetHashKey("rapidgt")] = 65.0,
    [GetHashKey("rapidgt2")] = 65.0,
    [GetHashKey("raptor")] = 65.0,
    [GetHashKey("revolter")] = 90.0,
    [GetHashKey("schafter2")] = 65.0,
    [GetHashKey("schafter3")] = 65.0,
    [GetHashKey("schafter4")] = 65.0,
    [GetHashKey("schafter5")] = 65.0,
    [GetHashKey("schlagen")] = 65.0,
    [GetHashKey("schwarzer")] = 65.0,
    [GetHashKey("sentinel3")] = 65.0,
    [GetHashKey("seven70")] = 65.0,
    [GetHashKey("specter")] = 65.0,
    [GetHashKey("specter2")] = 65.0,
    [GetHashKey("streiter")] = 65.0,
    [GetHashKey("sugoi")] = 65.0,
    [GetHashKey("sultan")] = 90.0,
    [GetHashKey("sultan2")] = 65.0,
    [GetHashKey("surano")] = 65.0,
    [GetHashKey("tampa2")] = 65.0,
    [GetHashKey("tropos")] = 65.0,
    [GetHashKey("verlierer2")] = 65.0,
    [GetHashKey("vstr")] = 65.0,
    [GetHashKey("italirsx")] = 65.0,
    [GetHashKey("veto")] = 65.0,
    [GetHashKey("veto2")] = 65.0,
    [GetHashKey("zr350")] = 65.0,
    [GetHashKey("calico")] = 65.0,
    [GetHashKey("futo2")] = 65.0,
    [GetHashKey("euros")] = 65.0,
    [GetHashKey("jester4")] = 65.0,
    [GetHashKey("remus")] = 65.0,
    [GetHashKey("comet6")] = 65.0,
    [GetHashKey("growler")] = 65.0,
    [GetHashKey("vectre")] = 65.0,
    [GetHashKey("cypher")] = 65.0,
    [GetHashKey("sultan3")] = 65.0,
    [GetHashKey("rt3000")] = 65.0,
    [GetHashKey("comet7")] = 65.0,
    [GetHashKey("sm722")] = 65.0,
    [GetHashKey("corsita")] = 65.0,



    --SPORTS CLASSIC
    [GetHashKey("ardent")] = 65.0,
    [GetHashKey("btype")] = 65.0,
    [GetHashKey("btype2")] = 65.0,
    [GetHashKey("btype3")] = 65.0,
    [GetHashKey("casco")] = 65.0,
    [GetHashKey("cheetah2")] = 65.0,
    [GetHashKey("coquette2")] = 65.0,
    [GetHashKey("deluxo")] = 65.0,
    [GetHashKey("dynasty")] = 65.0,
    [GetHashKey("fagaloa")] = 65.0,
    [GetHashKey("feltzer3")] = 65.0,
    [GetHashKey("gt500")] = 65.0,
    [GetHashKey("infernus2")] = 65.0,
    [GetHashKey("jb700")] = 65.0,
    [GetHashKey("jb7002")] = 65.0,
    [GetHashKey("mamba")] = 65.0,
    [GetHashKey("manana")] = 65.0,
    [GetHashKey("manana2")] = 65.0,
    [GetHashKey("michelli")] = 65.0,
    [GetHashKey("monroe")] = 65.0,
    [GetHashKey("nebula")] = 65.0,
    [GetHashKey("peyote")] = 65.0,
    [GetHashKey("peyote3")] = 65.0,
    [GetHashKey("pigalle")] = 65.0,
    [GetHashKey("rapidgt3")] = 65.0,
    [GetHashKey("retinue")] = 65.0,
    [GetHashKey("retinue2")] = 65.0,
    [GetHashKey("savestra")] = 65.0,
    [GetHashKey("stinger")] = 65.0,
    [GetHashKey("stromberg")] = 65.0,
    [GetHashKey("swinger")] = 65.0,
    [GetHashKey("torero")] = 65.0,
    [GetHashKey("tornado")] = 65.0,
    [GetHashKey("tornado2")] = 65.0,
    [GetHashKey("tornado3")] = 65.0,
    [GetHashKey("tornado4")] = 65.0,
    [GetHashKey("tornado5")] = 65.0,
    [GetHashKey("tornado6")] = 65.0,
    [GetHashKey("turismo2")] = 65.0,
    [GetHashKey("viseris")] = 65.0,
    [GetHashKey("z190")] = 65.0,
    [GetHashKey("ztype")] = 65.0,
    [GetHashKey("zion3")] = 65.0,
    [GetHashKey("cheburek")] = 65.0,
    [GetHashKey("toreador")] = 65.0,



    --SUPER 
    [GetHashKey("adder")] = 50.0,
    [GetHashKey("autarch")] = 50.0,
    [GetHashKey("banshee2")] = 50.0,
    [GetHashKey("bullet")] = 50.0,
    [GetHashKey("cheetah")] = 50.0,
    [GetHashKey("cyclone")] = 50.0,
    [GetHashKey("entity2")] = 50.0,
    [GetHashKey("entityxf")] = 50.0,
    [GetHashKey("emerus")] = 50.0,
    [GetHashKey("fmj")] = 50.0,
    [GetHashKey("furia")] = 50.0,
    [GetHashKey("gp1")] = 50.0,
    [GetHashKey("infernus")] = 50.0,
    [GetHashKey("italigtb")] = 50.0,
    [GetHashKey("italigtb2")] = 50.0,
    [GetHashKey("krieger")] = 50.0,
    [GetHashKey("le7b")] = 50.0,
    [GetHashKey("nero")] = 50.0,
    [GetHashKey("nero2")] = 50.0,
    [GetHashKey("osiris")] = 50.0,
    [GetHashKey("penetrator")] = 50.0,
    [GetHashKey("pfister811")] = 50.0,
    [GetHashKey("prototipo")] = 50.0,
    [GetHashKey("reaper")] = 50.0,
    [GetHashKey("s80")] = 50.0,
    [GetHashKey("sc1")] = 50.0,
    [GetHashKey("scramjet")] = 50.0,
    [GetHashKey("sheava")] = 50.0,
    [GetHashKey("sultanrs")] = 50.0,
    [GetHashKey("t50")] = 50.0,
    [GetHashKey("taipan")] = 50.0,
    [GetHashKey("tempesta")] = 50.0,
    [GetHashKey("tezeract")] = 50.0,
    [GetHashKey("thrax")] = 50.0,
    [GetHashKey("tigon")] = 50.0,
    [GetHashKey("turismor")] = 50.0,
    [GetHashKey("tyrant")] = 50.0,
    [GetHashKey("tyrus")] = 50.0,
    [GetHashKey("vacca")] = 50.0,
    [GetHashKey("vagner")] = 50.0,
    [GetHashKey("visione")] = 50.0,
    [GetHashKey("voltic")] = 50.0,
    [GetHashKey("xa21")] = 50.0,
    [GetHashKey("zentorno")] = 50.0,
    [GetHashKey("zorrusso")] = 50.0,
    [GetHashKey("champion")] = 50.0,
    [GetHashKey("ignus")] = 50.0,
    [GetHashKey("zeno")] = 50.0,
    [GetHashKey("torero")] = 50.0,
    [GetHashKey("lm87")] = 50.0,



    --VANS
    [GetHashKey("bison")] = 250.0,
    [GetHashKey("bison2")] = 250.0,
    [GetHashKey("bison3")] = 250.0,
    [GetHashKey("bobcatxl")] = 200.0,
    [GetHashKey("burrito")] = 200.0,
    [GetHashKey("burrito2")] = 200.0,
    [GetHashKey("burrito3")] = 200.0,
    [GetHashKey("burrito4")] = 200.0,
    [GetHashKey("camper")] = 300.0,
    [GetHashKey("gburrito")] = 200.0,
    [GetHashKey("gburrito2")] = 200.0,
    [GetHashKey("journey")] = 250.0,
    [GetHashKey("minivan")] = 65.0,
    [GetHashKey("minivan2")] = 65.0,
    [GetHashKey("paradise")] = 200.0,
    [GetHashKey("pony")] = 200.0,
    [GetHashKey("pony2")] = 200.0,
    [GetHashKey("rumpo")] = 200.0,
    [GetHashKey("rumpo3")] = 200.0,
    [GetHashKey("rumpo2")] = 200.0,
    [GetHashKey("speedo")] = 200.0,
    [GetHashKey("speedo4")] = 200.0,
    [GetHashKey("surfer")] = 150.0,
    [GetHashKey("surfer2")] = 150.0,
    [GetHashKey("taco")] = 150.0,
    [GetHashKey("youga")] = 200.0,
    [GetHashKey("youga2")] = 200.0,
    [GetHashKey("youga3")] = 200.0,
    [GetHashKey("youga4")] = 200.0,
    [GetHashKey("guardian")] = 200.0,
    [GetHashKey("rubble")] = 400.0,
    [GetHashKey("pounder2")] = 850.0,



    --IMPORT
    [GetHashKey("gle63")] = 100.0,
    [GetHashKey("rmodlp670")] = 100.0,
    [GetHashKey("q820")] = 100.0,
    [GetHashKey("rmodrs6")] = 100.0,
    [GetHashKey("rmodrs6r")] = 100.0,
    [GetHashKey("rs318")] = 100.0,
    [GetHashKey("rs322")] = 150.0,
    [GetHashKey("rs7r")] = 100.0,
    [GetHashKey("cb500f")] = 20.0,
    [GetHashKey("rmodm5e34")] = 100.0,
    [GetHashKey("rmodrover")] = 150.0,
    [GetHashKey("r820")] = 50.0,
    [GetHashKey("2019gt3rs")] = 50.0,
    [GetHashKey("BRABUS700")] = 300.0,
    [GetHashKey("c63")] = 100.0,
    [GetHashKey("gladiator")] = 190.0,
    [GetHashKey("rmodg65")] = 100.0,
    [GetHashKey("gtr")] = 50.0,
    [GetHashKey("panamera17turbo")] = 100.0,
    [GetHashKey("lp610")] = 50.0,
    [GetHashKey("raptor150")] = 300.0,
    [GetHashKey("rmodcharger69")] = 100.0,
    [GetHashKey("roma20")] = 50.0,
    [GetHashKey("rmodmustang")] = 50.0,
    [GetHashKey("tmaxdx")] = 50.0,
    [GetHashKey("primoard")] = 150.0,
    [GetHashKey("AMGGTRR20")] = 150.0,
    [GetHashKey("ct5vbw22")] = 150.0,
    [GetHashKey("golf7gti")] = 100.0,
    [GetHashKey("mers63c")] = 70.0,
    [GetHashKey("rmodbacalar")] = 50.0,
    [GetHashKey("rmode63s")] = 100.0,
    [GetHashKey("rmodgt63")] = 100.0,
    [GetHashKey("rmodgtr50")] = 100.0,
    [GetHashKey("sq72016")] = 120.0,
    [GetHashKey("subarusti7")] = 70.0,
    [GetHashKey("m5per")] = 100.0,
    [GetHashKey("812mansory")] = 100.0,
    [GetHashKey("gxa45")] = 90.0,
    [GetHashKey("gtz34")] = 100.0,
    [GetHashKey("06sx2t")] = 20.0,
    [GetHashKey("370z")] = 100.0,
    [GetHashKey("250e2")] = 60.0,
    [GetHashKey("a80")] = 80.0,
    [GetHashKey("brabuse700")] = 110.0,
    [GetHashKey("c7")] = 90.0,
    [GetHashKey("dk350z")] = 100.0,
    [GetHashKey("filthynsx")] = 100.0,
    [GetHashKey("w463a1")] = 150.0,
    [GetHashKey("gemera")] = 80.0,
    [GetHashKey("gxgiulia")] = 100.0,
    [GetHashKey("m3f80")] = 100.0,
    [GetHashKey("gle53")] = 130.0,
    [GetHashKey("gt2022")] = 100.0,
    [GetHashKey("gle63")] = 150.0,
    [GetHashKey("mrx7")] = 100.0,
    [GetHashKey("mlmansory")] = 80.0,
    [GetHashKey("208t16")] = 60.0,
    [GetHashKey("rmodm4gts")] = 100.0,
    [GetHashKey("Roxanne")] = 90.0,
    [GetHashKey("rsq8m")] = 150.0,
    [GetHashKey("urustc")] = 150.0,
    [GetHashKey("topfoil")] = 100.0,
    [GetHashKey("brz")] = 90.0,
    [GetHashKey("rmodg65")] = 150.0,
    [GetHashKey("nspeedo")] = 200.0,
    


    --HELICO
    [GetHashKey("frogger")] = 100.0,

    
    --AVION
    [GetHashKey("cuban800")] = 500.0,
    [GetHashKey("il76")] = 10000.0,
    
    --BOAT
    [GetHashKey("dinghy4")] = 500.0,
    [GetHashKey("tug")] = 10000.0,
}