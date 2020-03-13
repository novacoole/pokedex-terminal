# frozen_string_literal: true

require_relative 'classes/Main_menu'

fork { exec "artii 'Pokedex' --font larry3d | lolcat -a -d 15" }
sleep(8)
Main_menu.run
