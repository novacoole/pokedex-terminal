# frozen_string_literal: true

require_relative './Print'
require_relative './Main_menu'

class Search
  def self.by_name(data)
    search_prompt = TTY::Prompt.new(active_color: :red)
    poke_array = []
    data.each do |hash|
      hash.each do |k, v|
        poke_array << v if k == :name
      end
    end
    search_prompt.select('Please enter the name of the Pokemon you\'re looking for.', poke_array, filter: true)
  end

  def self.return_hash(data, name)
    data.each do |hash|
      return hash if hash[:name] == name
    end
  end
end
