# frozen_string_literal: true

require_relative 'classes/Main_menu'

fork { exec "artii 'Pokedex' --font larry3d | lolcat -a -d 15" }
fork { exec "mpg123 -q lib/Pokemon.mp3"}
sleep(8)
Main_menu.run