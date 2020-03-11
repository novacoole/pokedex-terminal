require 'tty-prompt'

class List
  
  def self.list_menu(data)
    while true
      list_prompt = TTY::Prompt.new(active_color: :red)
      user_input = list_prompt.select("How would you like to list the Pokemon?\nPlease enter one of the following options.") do |menu|
      menu.choice "List all", 1
      menu.choice "List by Type", 2
      menu.choice "List by Secondary Type",3
      menu.choice "List by Generation", 4
      menu.choice "List Legendary Pokemon", 5
      end
      case user_input
        when 1
          puts "-" * 40
          puts "Listing all Pokemon"
          puts "-" * 40
          list_all(data)
        when 2
          puts "Which Type would you like to list by?"
          user_input = New.add_type
          puts "-" * 40
          puts "Listing by #{user_input} Type:"
          puts "-" * 40
          list_by(data,:type_1,user_input)
        when 3
          puts "Which Secondary Type would you like to list by?"
          user_input = New.add_type
          puts "-" * 40
          puts "Listing by #{user_input} Secondary Type:"
          puts "-" * 40
          list_by(data,:type_2,user_input)
        when 4
          while true
            user_input = list_prompt.ask("Which generation would you like to list by?\nInput a number between 1-8.") { |q| q.in('1-8') }
            puts "-" * 40
            puts "Listing by Generation #{user_input}"
            puts "-" * 40
            list_by(data,:generation, user_input.to_i)
          end
        when 5
          puts "-" * 40
          puts "Listing Legendary Pokemon"
          puts "-" * 40
          list_by(data,:legendary,'True')
        else
          puts "Invalid selection, please enter a number between 1-5."
      end
    end
  end

  def self.list_all(data)
    data.each do |hash|
      Print.print_pokemon_condensed(hash)
    end
  puts "-" * 40
  Main_menu.return?
  end

  def self.list_by(data,attribute,value)
    data.each do |hash|
      if hash[attribute] == value
      Print.print_pokemon_condensed(hash)
      end
    end
  puts "-" * 40
  Main_menu.return?
  end

end

