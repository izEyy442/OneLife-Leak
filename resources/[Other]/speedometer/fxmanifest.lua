fx_version "cerulean"

description "Speedometer FiveM Script"
author "Sertinox x CyteUI"
version '1.0.0'

lua54 'yes'

games {
  "gta5",
  "rdr3"
}

ui_page 'web/build/index.html'

client_script "client/**/*"

files {
	'web/build/index.html',
	'web/build/**/*',
}