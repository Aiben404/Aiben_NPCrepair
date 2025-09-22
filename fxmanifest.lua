fx_version 'cerulean'

game 'gta5'

description 'NPC Vehicle Repair for ESX'

version '1.0.0'

lua54 'yes'

author 'Aiben'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua',
}
