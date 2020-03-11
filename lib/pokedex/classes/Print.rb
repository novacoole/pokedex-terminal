require_relative './Main_menu'
require 'colorize'

class Print

  def self.print_pokemon_expanded(hash)
    puts "-" * 40
    puts "#{hash[:name]}"
    puts "-" * 40
    print "#{hash[:name]} belongs to the #{hash[:type_1]} type"
    if hash[:type_2] != nil
      print ", with a secondary type of #{hash[:type_2]} \n"
    else
      print ".\n"
    end
    puts "Total: #{hash[:total]}"
    puts "HP: #{hash[:hp]}"
    print "Attack: #{hash[:attack]}             Defense :#{hash[:defense]}\n"
    print "Special Attack: #{hash[:"sp._atk"]}     Special Defense: #{hash[:"sp._def"]}\n"
    puts "Speed: #{hash[:speed]}"
    puts "They are of Generation #{hash[:generation]}."
    if hash[:legendary] == 'True'
      puts "Most importantly, #{hash[:name]} is a legendary Pokemon!"
    end
    puts "-" * 40
    Main_menu.return?
  end

  def self.print_pokemon_condensed(hash)
    name = "#{hash[:name]}"
    case hash[:type_1]
      when "Normal"
        name.brown
      when "Fire"
        name.red
      when "Water" 	
        name.blue
      when "Grass"
      when "Electric" 	
      when "Ice"
      when "Fighting" 	
      when "Poison"
      when "Ground"
      when "Flying"
      when "Psychic"
      when "Bug"
      when "Rock"
      when "Ghost"
      when "Dark" 	
      when "Dragon"
      when "Steel" 	
      when "Fairy"
    end
  end

end