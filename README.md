# Character Enumerator

Ruby enumerator that converts integers to character representation(Like in Microsoft Excel - A, B, C, .. Z, AA, AB)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'character_enumerator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install character_enumerator

## Usage

```ruby
CharacterEnumerator.integer_to_characters(0) # => "A"
CharacterEnumerator.integer_to_characters(0) # => "A"
CharacterEnumerator.integer_to_characters(1) # => "B"
CharacterEnumerator.integer_to_characters(25) # => "Z"
CharacterEnumerator.integer_to_characters(26) # => "AA"
CharacterEnumerator.integer_to_characters(27) # => "AB"
CharacterEnumerator.integer_to_characters(51) # => "AZ"
CharacterEnumerator.integer_to_characters(52) # => "BA"
CharacterEnumerator.integer_to_characters(200_000) # => "KIVI"

# Will print A, B, C, D, E
CharacterEnumerator.generate(5).each do |char|
  puts char
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/krists/character_enumerator.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
