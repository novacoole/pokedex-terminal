# frozen_string_literal: true

require_relative './Main_menu'
require 'colorize'

class Print
  def self.print_pokemon_expanded(hash)
    puts '-' * 40
    puts (hash[:name]).to_s
    puts '-' * 40
    print "#{hash[:name]} belongs to the #{colorize_attribute(hash, :type_1, :type_1)} type"
    if !hash[:type_2].nil?
      print ", with a secondary type of #{colorize_attribute(hash, :type_2, :type_2)} \n"
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
    puts '-' * 40
    Main_menu.return?
  end

  def self.print_pokemon_condensed(hash)
    puts colorize_attribute(hash, :name, :type_1)
  end

  def self.colorize_attribute(hash, key, type)
    attribute = ''
    hash.each do |k, v|
      attribute = v if k == key
    end
    case hash[type]
    when 'Normal'
      attribute
    when 'Fire'
      attribute.colorize(:red)
    when 'Water'
      attribute.colorize(:blue)
    when 'Grass'
      attribute.colorize(:green)
    when 'Electric'
      attribute.colorize(:light_blue)
    when 'Ice'
      attribute.colorize(:default)
    when 'Fighting'
      attribute.colorize(:light_red)
    when 'Poison'
      attribute.colorize(:cyan)
    when 'Ground'
      attribute.colorize(:default)
    when 'Flying'
      attribute.colorize(:light_white)
    when 'Psychic'
      attribute.colorize(:light_magenta)
    when 'Bug'
      attribute.colorize(:light_green)
    when 'Rock'
      attribute.colorize(:white)
    when 'Ghost'
      attribute.colorize(:light_black)
    when 'Dark'
      attribute.colorize(:black)
    when 'Dragon'
      attribute.colorize(:light_yellow)
    when 'Steel'
      attribute.colorize(:light_cyan)
    when 'Fairy'
      attribute.colorize(:magenta)
    end
  end
end
