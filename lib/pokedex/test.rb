require 'tty-prompt'

string_1 = ['hello','again','my','old','friend']

prompter = TTY::Prompt.new
p prompter.select('Choose your destiny?', string_1, filter: true)