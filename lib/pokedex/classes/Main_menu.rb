require_relative './Search'
require_relative './Update'
require_relative './New'
require_relative './List'
require_relative './Delete'
require 'tty-prompt'
require 'smarter_csv'

class Main_menu
@@pokemon_data = SmarterCSV.process('../../data/pokemon.csv')

  def self.run
    while true
      main_menu_prompt = TTY::Prompt.new(active_color: :red)
      puts "-" * 40
      # main_menu_prompt.warn("        Welcome to your Pokedex!")
      puts "        Welcome to your Pokedex!        ".blue.on_red.blink
      puts "-" * 40
      user_input = main_menu_prompt.select("Please select from the following:") do |menu|
      menu.choice 'List Pokemon', 1 
      menu.choice 'Search for a Pokemon', 2
      menu.choice 'Update an existing Pokemon', 3
      menu.choice 'Add a new Pokemon', 4
      menu.choice 'Delete a Pokemon', 5 
      menu.choice 'Exit', 6
      menu.choice 'Print hashes', 7
      end
      case user_input
        when 1
          List.list_menu(@@pokemon_data)
        when 2
          name = Search.by_name(@@pokemon_data)
          hash = Search.return_hash(@@pokemon_data, name)
          Print.print_pokemon_expanded(hash)
        when 3
          Update.update_pokemon_menu(@@pokemon_data)
          ## Incomplete
        when 4
          new_hash = New.add_pokemon
          Print.print_pokemon_expanded(new_hash)
          @@pokemon_data << new_hash
        when 5
          @@pokemon_data = Delete.delete(@@pokemon_data)
        when 6
          exit
        when 7
          pp @@pokemon_data
        else
          "Invalid selection, please select from the following options."
      end
    end
  end

  def self.return?
    puts "Press enter to return to the Main Menu."
    user_input = gets.chomp
    run()
  end

end