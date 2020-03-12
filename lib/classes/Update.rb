require_relative './New'
require_relative './Search'

class Update

  def self.update_pokemon_menu(data)
    update_prompt = TTY::Prompt.new(active_color: :red)
    name = Search.by_name(data)
    data.each do |hash|
      if hash[:name] == name
        user_input = update_prompt.select("Which attribute would you like to update?") do |menu|
          menu.choice "Name", 1
          menu.choice "Type", 2
          menu.choice "Secondary Type", 3
          menu.choice "HP", 4
          menu.choice "Attack", 5
          menu.choice "Defense", 6
          menu.choice "Special Attack", 7
          menu.choice "Special Defense", 8
          menu.choice "Speed", 9
          menu.choice "Generation", 10
          menu.choice "Legendary", 11
          menu.choice "Exit this menu", 12
        end
        case user_input
          when 1
            puts "What would you like #{hash[:name]}'s new name to be?"
            name = New.add_name
            hash[:name] = name
          when 2
            puts "What would you like #{hash[:name]}'s new type to be?"
            type_1 = New.add_type
            hash[:type_1] = type_1
          when 3
            puts "What would you like #{hash[:name]}'s new secondary type to be?"
            type_2 = New.add_type
            hash[:type_2] = type_2
          when 4
            hp = New.add_points('HP')
            hash[:hp] = hp
          when 5
            attack = New.add_points('Attack')
            hash[:attack] = attack
          when 6
            defense = New.add_points('Defense')
            hash[:defense] = defense
          when 7
            sp_atk = New.add_points('Special Attack')
            hash[:"sp._atk"] = sp_atk
          when 8
            sp_def = New.add_points('Special Defense')
            hash[:"sp._def"] = sp_def
          when 9
            speed = New.add_points('Speed')
            hash[:speed] = speed
          when 10
            generation = New.add_generation
            hash[:generation] = generation
          when 11
            legendary = New.add_legendary
            hash[:legendary] = legendary
          when 12
            Main_menu.run
        end
      end
    end
  end

end
