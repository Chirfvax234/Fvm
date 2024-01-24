fx_version 'bodacious'
game 'gta5'

ui_page 'html/index.html'

files {
    'html/index.html',
	'html/js/*.js',
	'html/img/*.png',
	'html/css/*.css',
	'html/css/*.gif',
}

server_scripts {
	'@oxmysql/lib/MySQL.lua', -- OXMYSQL
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'config.lua',
	'client/utils.lua',
	'client/main.lua'
}

export 'GeneratePlate'
