require_relative './Print'
require_relative './Main_menu'

class Search

  def self.by_name(data)
    search_prompt = TTY::Prompt.new(active_color: :red)
    poke_array = []
    data.each do |hash|
      hash.each do |k,v|
        if k == :name
          poke_array << v
        end
      end
    end
    return search_prompt.select('Please enter the name of the Pokemon you\'re looking for.', poke_array, filter: true)
  end

  def self.return_hash(data, name)
    data.each do |hash|
      if hash[:name] == name
        return hash
      end
    end
  end

end