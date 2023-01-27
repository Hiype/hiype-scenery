fx_version 'cerulean'
game 'gta5'

author 'Hiype'
description 'Relieve stress by looking at beautiful scenes'
version '1.0.0'

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/client.lua',
}
server_scripts {
    'server/server.lua',
}

shared_scripts {
    '@qb-core/shared/locale.lua',
    'config.lua',
    'lang.lua',
}

lua54 'yes'