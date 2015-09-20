# BalanceChecker

Easy way to auto-check your ISP balance (for those retarted providers who lack of this functionality). Only one provider (TisDialog) supported at this time, but it's easy to implement another. Just create a class withing `providers` directory and implement `check` method returning a number.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'balance_checker', github: 'olegantonyan/balance_checker'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ git clone git@github.com:olegantonyan/balance_checker.git
    $ cd balance_checker
    $ bundle install

## Usage

Check `config/balance_checker.yml.example` for configuration options.

* `providers`: array of available providers. Name must match with class name inside `providers/` directory (either class_name == ClassName);
* `notifiers`: same as providers. Each notifier gets called for each provider when threshold is reached;
* `threshold`: when your balance falls below this number you will be notified. To disable notification use -10000000 or something like that.

### As standalone program

    $ cd balance_checker
    $ bundle exec ./bin/balance_checker -c /path/to/config.yml #leave -c option to use default config/balance_checker.yml (don't forget to create it)

For convenience you can wrap it into shell script and run via cron, for example.

### As gem

Somewhere in initializer add
```ruby
BalanceChecker.configure_with '/path/to/config/file.yml'
```
Or alternatively you can user hash instead of config file with same structure
```ruby
BalanceChecker.configure {providers: [...], notifiers: [...], threshold: 50}
```
Then to run it
```ruby
BalanceChecker.run!
```
Note: this call will block until finished. Use it in separate thread/background worker only.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/olegantonyan/balance_checker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
