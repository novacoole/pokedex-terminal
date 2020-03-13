# frozen_string_literal: true

require_relative './Search'
require_relative './Update'
require_relative './New'
require_relative './List'
require_relative './Delete'
require 'tty-prompt'
require 'smarter_csv'


class Main_menu
  # Creates an array of hashes from the CSV file with keys taken from CSV headers.
  @@pokemon_data = SmarterCSV.process('classes/pokemon.csv')

  def self.run
    loop do
      system 'clear'
      sleep 0.1
      fork { exec "artii 'Pokedex' --font larry3d | lolcat" }
      sleep(0.3)
      main_menu_prompt = TTY::Prompt.new(active_color: :red)
      puts '-' * 40
      puts '        Welcome to your Pokedex!        '.blue.on_red.blink
      puts '-' * 40
      user_input = main_menu_prompt.select('Please select from the following:') do |menu|
        menu.choice 'List Pokemon', 1
        menu.choice 'Search for a Pokemon', 2
        menu.choice 'Update an existing Pokemon', 3
        menu.choice 'Add a new Pokemon', 4
        menu.choice 'Delete a Pokemon', 5
        menu.choice 'Exit and save changes', 6
        # menu.choice 'Print hashes', 7
      end
      case user_input
      when 1
        list_pokemon
      when 2
        search_pokemon
      when 3
        update_pokemon
      when 4
        new_pokemon
      when 5
        delete_pokemon
      when 6
        exit_menu
      # uncomment below 2 lines to allow developer feature to check hashes
      # when 7
      # pp @@pokemon_data
      else
        'Invalid selection, please select from the following options.'
      end
    end
  end

  def self.return?
    puts 'Press enter to return to the Main Menu.'
    user_input = gets.chomp
    run
  end

  def self.list_pokemon
    List.list_menu(@@pokemon_data)
  end

  def self.search_pokemon
    Print.print_pokemon_expanded(Search.return_hash(@@pokemon_data, Search.by_name(@@pokemon_data)))
  end

  def self.update_pokemon
    Update.update_pokemon_menu(@@pokemon_data)
  end

  def self.new_pokemon
    new_hash = New.add_pokemon
    @@pokemon_data << new_hash
    Print.print_pokemon_expanded(new_hash)
  end

  def self.delete_pokemon
    @@pokemon_data = Delete.delete(@@pokemon_data)
  end

  def self.exit_menu
    save_changes = main_menu_prompt.ask('Are you sure you want to save your changes?')
    if save_changes == true
      CSV.open('classes/pokemon.csv', 'wb') do |csv|
        keys = @@pokemon_data.first.keys
        csv << keys
        @@pokemon_data.each do |hash|
          csv << hash.values_at(*keys)
        end
      end
      exit
    else
      exit
    end
  end
end
