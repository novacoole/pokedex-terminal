# frozen_string_literal: true

require_relative 'lib/terminal/version'

Gem::Specification.new do |spec|
  spec.name          = 'pokedex-terminal'
  spec.version       = Pokedex::Terminal::VERSION
  spec.authors       = ['nova']
  spec.email         = ['alexander.coole@protonmail.com']

  spec.summary       = 'Pokedex'
  spec.description   = 'Pokedex in terminal with CRUD functionality.'
  spec.homepage      = 'https://rubygems.org/gems/pokedex-terminal'
  spec.license       = 'GPL-3.0-or-later'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')
  spec.executables   = ['pokedex-terminal']
  spec.require_paths = ['lib']
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables   = ['pokedex-terminal']
  spec.require_paths = ['lib']
  spec.add_runtime_dependency 'artii', '~> 2.1', '>= 2.1.2'
  spec.add_runtime_dependency 'colorize', '~> 0.8.1'
  spec.add_runtime_dependency 'lolcat', '~> 100.0', '>= 100.0.1'
  spec.add_runtime_dependency 'smarter_csv', '~> 1.1', '>= 1.1.4'
  spec.add_runtime_dependency 'tty-prompt', '~> 0.21.0'
end
