require_relative 'classes/Main_menu'

fork{exec "artii './titlesequence.plaintext' --font larry3d | lolcat -a -d 15"}
sleep(10)
system 'clear'
Main_menu.run