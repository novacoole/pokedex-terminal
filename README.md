# Pokedex::Terminal

This terminal application seeks to emulate the basic functionality of the fictional ‘Pokedex’ device from within the Pokemon universe; a digital encyclopaedia of all existing Pokemon, their ‘Types’ and their attributes.

While several Pokedex applications exist, pokedex-terminal seeks to run with minimal computational resources as to allow access to the widest audience possible, particuarly those using outdated devices.

pokedex-terminal also allows offline access to Pokemon attributes and descriptions for usage in situations where there is no internet access, or if Pokemon-related online content has been blocked/censored under oppressive regimes.

## Installation

```
$ gem install pokedex-terminal
```    

## Usage

```
$ pokemon-terminal
```

## Features

This application allows the user to do the following:

### List

When the user selects "List Pokemon" from the main menu, the list_menu method of the List class is called. This method contains a menu system derived from 'tty-prompt' gem. This menu offers several options:

1. "List all"

    To List all pokemon, the .list_all method of the List class is called. This method takes an input of data (@@pokemon_data). Then, a .each loop to iterate through the @@pokemon_data object (which contains hashes for each Pokemon). For each hash, the .print_pokemon_condensed method of the Print class is called with that hash an input. This method prints only the ':name' value of that hash.

2. "List by Type"

    To list Pokemon by type, firstly the .add_type method belonging to the New class is called. This presents the user with a 'tty-prompt' .select menu which allows them to select a Pokemon Type. The user choice is returned and stored in the 'user_input' variable.
    
    Then the .list_by method of the List class is called. This method takes an input of data (@@pokemon_data), the hash key we want to filter within (:type_1), and the exact value we want to filter (user_input).

    This method uses a .each method to iterate through  each hash the @@pokemon_data object, if a hash's ':type_1' value matches user_input, the .print_pokemon_condensed method of the Print class is called with that hash an input. This method prints only the ':name' value of that hash.

3. "List by Secondary Type"

    To list Pokemon by type, firstly the .add_type method belonging to the New class is called. This presents the user with a 'tty-prompt' .select menu which allows them to select a Pokemon Secondary Type. The user choice is returned and stored in the 'user_input' variable.
    
    Then the .list_by method of the List class is called. This method takes an input of data (@@pokemon_data), the hash key we want to filter within (:type_2), and the exact value we want to filter (user_input).

    This method uses a .each method to iterate through  each hash the @@pokemon_data object, if a hash's ':type_2' value matches user_input, the .print_pokemon_condensed method of the Print class is called with that hash an input. This method prints only the ':name' value of that hash.

4. "List by Generation"

    To list Pokemon by generation, firstly a 'tty-prompt' ..ask method is used to prompt the user for a number between 1-8. This input is returned and stored in a variable called 'user_input.

    Then the .list_by method of the List class is called. This method takes an input of data (@@pokemon_data), the hash key we want to filter within (:generation), and the exact value we want to filter (user_input converted to an integer).

    This method uses a .each method to iterate through  each hash the @@pokemon_data object, if a hash's ':generation' value matches user_input, the .print_pokemon_condensed method of the Print class is called with that hash an input. This method prints only the ':name' value of that hash.


5. "List Legendary Pokemon"

    To list Pokemon by generation, the .list_by method of the List class is called. This method takes an input of data (@@pokemon_data), the hash key we want to filter within (:legendary), and the exact value we want to filter ('True').

    This method uses a .each method to iterate through  each hash the @@pokemon_data object, if a hash's ':generation' value matches 'True', the .print_pokemon_condensed method of the Print class is called with that hash an input. This method prints only the ':name' value of that hash.

----

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pokedex-terminal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/pokedex-terminal/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [GPL-3.0 License](https://opensource.org/licenses/GPL-3.0).

## Code of Conduct

Everyone interacting in the Pokedex::Terminal project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pokedex-terminal/blob/master/CODE_OF_CONDUCT.md).
