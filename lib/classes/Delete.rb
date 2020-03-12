require 'tty-prompt'
require_relative './Main_menu'

class Delete
  
  def self.delete(data)
    delete_prompt = TTY::Prompt.new(active_color: :red)
      poke_array = []
      data.each do |hash|
        hash.each do |k,v|
          if k == :name
            poke_array << v
          end
        end
      end
      user_input = delete_prompt.select('Please enter the name of the Pokemon you\'re looking to delete', poke_array, filter: true)
      data.each_with_index do |hash, index|
        if hash[:name] == user_input
          user_input_2 = delete_prompt.yes?("Are you sure you want to permanently delete #{hash[:name]}?")
          if user_input_2 == true
            data.delete_at(index)
            return data
          else
            Main_menu.run
          end
        end
      end
  end

end