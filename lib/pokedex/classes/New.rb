class New

  def self.add_pokemon
    puts "So you want to create a new Pokemon, what will you call it?"
    name = add_name()
    puts "What type will your Pokemon belong to?"
    type_1 = add_type()
    puts "Now for the secondary type."
    type_2 = add_type()
    hp = add_points('HP')
    attack = add_points('Attack')
    defense = add_points('Defense')
    sp_atk = add_points('Special Attack')
    sp_def = add_points('Special Defense')
    speed = add_points('Speed')
    generation = add_generation()
    legendary = add_legendary()
    total = hp + attack + sp_atk + sp_def + speed
    hash = {}
    hash[:name] = name
    hash[:type_1] = type_1
    hash[:type_2] = type_2
    hash[:total] = total
    hash[:hp] = hp
    hash[:attack] = attack
    hash[:defense] = defense
    hash[:"sp._atk"] = sp_atk
    hash[:"sp._def"] = sp_def
    hash[:speed] = speed
    hash[:generation] = generation
    hash[:legendary] = legendary
    pp hash
    return hash
  end


  def self.add_name
    print "> "
    return gets.chomp
  end

  def self.add_type
    new_prompt = TTY::Prompt.new(active_color: :red)
    user_input = new_prompt.select("Please select a Type.") do |menu|
      menu.choice "Normal"
      menu.choice "Fire"
      menu.choice "Water" 	
      menu.choice "Grass"
      menu.choice "Electric" 	
      menu.choice "Ice"
      menu.choice "Fighting" 	
      menu.choice "Poison"
      menu.choice "Ground"
      menu.choice "Flying"
      menu.choice "Psychic"
      menu.choice "Bug"
      menu.choice "Rock"
      menu.choice "Ghost"
      menu.choice "Dark" 	
      menu.choice "Dragon"
      menu.choice "Steel" 	
      menu.choice "Fairy"
    end
    return user_input
  end

  def self.add_points(attribute)
    while true
      puts "How many points would you like this Pokemon to have for #{attribute}?"
      print "> "
      user_input = gets.chomp.to_i
      if user_input > 0
        return user_input
      else
        puts "Invalid selection. Please input a number greater than 0."
      end
    end
  end

  def self.add_generation
    new_prompt = TTY::Prompt.new(active_color: :red)
    user_input = new_prompt.ask("Which generation does this Pokemon belong to?\nInput a number between 1-8.") do |q|
     q.in('1-8')
      q.messages[:valid?] = 'Invalid number, select a number from 1-8'
    end
    return user_input
  end

  def self.add_legendary
    new_prompt = TTY::Prompt.new(active_color: :red)
    user_input = new_prompt.yes?('Is this Pokemon legendary?') do |q|
      q.messages[:valid?] = "Invalid response, select 'Y' or 'n'"
    end
    p user_input
    return user_input = true ? 'True' : 'False'
  end

end