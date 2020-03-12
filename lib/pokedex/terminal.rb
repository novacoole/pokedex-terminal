require_relative 'classes/Main_menu'

fork{exec "artii 'Pokedex' --font larry3d | lolcat -a -d 15"}
sleep(10)

Main_menu.run