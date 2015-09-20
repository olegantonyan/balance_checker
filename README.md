# BalanceChecker

Easy way to auto-check your ISP balance (for those retarted providers who lack of this functionality). Only one provider (TisDialog) supported at this time, but it's easy to implement another. Just create a class withing `providers` directory and implement `check` method returning a number.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'balance_checker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install balance_checker

## Usage

### As standalone program

### As gem

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/olegantonyan/balance_checker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
