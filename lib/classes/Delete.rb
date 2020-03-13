# frozen_string_literal: true

# this class handles delete functionality by iterating through our data until we match with user's selected pokemon date, and then deleting the entire hash.

require 'tty-prompt'
require_relative './Main_menu'

class Delete
  def self.delete(data)
    delete_prompt = TTY::Prompt.new(active_color: :red)
    user_input Search.by_name(data)
    data.each_with_index do |hash, index|
      next unless hash[:name] == user_input

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
