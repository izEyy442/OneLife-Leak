fx_version 'cerulean'
game 'gta5'
description 'rpemotes'
version '1.8.0'

lua54 'yes'
use_experimental_fxv2_oal 'yes'

provide "rpemotes"

dependencies {
    '/server:6683',
    '/onesync'
}

files {
    'conditionalanims.meta',
    'header.png'
}

data_file 'CONDITIONAL_ANIMS_FILE' 'conditionalanims.meta'

shared_scripts {
    'config.lua',
    'locale.lua',
    'locales/*.lua',
    'animals.lua'
}

server_scripts {
    'server/Server.lua',
    'server/frameworks/*.lua'
}

client_scripts {
    'NativeUI.lua',
    'client/Utils.lua',
    'client/AnimationList.lua',
    'client/AnimationListCustom.lua',
    'client/Emote.lua',
    'client/EmoteMenu.lua',
    'client/Expressions.lua',
    'client/NoIdleCam.lua',
    'client/Ragdoll.lua',
    'client/Syncing.lua',
    'client/Walk.lua',
    'client/frameworks/*.lua'
}

data_file 'DLC_ITYP_REQUEST' 'stream/rpemotesreborn_props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/brummie_props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_camp_props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/apple_1.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/kaykaymods_props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/knjgh_pizzas.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/natty_props_lollipops.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/ultra_ringcase.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/pata_props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/vedere_props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/pnwsigns.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/pprp_icefishing.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/scully_props.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/samnick_prop_lighter01.ytyp'
data_file 'DLC_ITYP_REQUEST' 'stream/bzzz_murderpack.ytyp'
