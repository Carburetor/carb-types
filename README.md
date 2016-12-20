# carb-types

A set of [dry-types](http://dry-rb.org/gems/dry-types/) to ensuer type safety
for common objects.

TODO: Add tests

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'carb-types'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carb-types

## Usage

Please refer to [dry-types](http://dry-rb.org/gems/dry-types/) for usage. The
provided types are:

- `Carb::Types::Proc` ensures the object is a proc
- `Carb::Types::IndifferentSymbol` ensures the object is a symbol, even if
  string passed
- `ArrayOfIndifferentSymbols` ensures the object is a valid array of
  `IndifferentSymbol`
- `Carb::Types::StringHash` ensures a hash has only string keys
- `Carb::Types::UUID` ensures a string is a valid UUID
- `Carb::Types::PG::StringArray` ensures an array is a valid postgres text array
- `Carb::Types::PG::JSONB` ensures a hashmap, an array or an object are valid
  JSON for postgres. `JSONBArray`, `JSONBHash` and `JSONBOp` are also provided,
  ensuring the object is an Array, hash or basic object for JSON
- `Carb::Types::PG::Bytea` ensures the object is a valid blob for postgres
- `Carb::Types::PG::CoercibleJSONBHash` ensures the `JSONBHash` can be converted
  to/from a ruby `Hash`
- `Carb::Types::PG::Tsvector` ensures the object is a valid postgres tsvector

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Carburetor/carb-types.

