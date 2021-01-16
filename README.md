# TaiwanValidator

[![Build Status](https://travis-ci.com/abookyun/taiwan_validator.svg)](https://travis-ci.com/abookyun/taiwan_validator)
[![Code Climate](https://codeclimate.com/github/abookyun/taiwan_validator/badges/gpa.svg)](https://codeclimate.com/github/abookyun/taiwan_validator)
[![Test Coverage](https://codeclimate.com/github/abookyun/taiwan_validator/badges/coverage.svg)](https://codeclimate.com/github/abookyun/taiwan_validator/coverage)

TaiwanValidator provides set of commonly used validators in Taiwan for Rails applications.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'taiwan_validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install taiwan_validator

## Usage

```ruby
include TaiwanValidator

validates :ubn, ubn: true
validates :id, id: true
validates :address, address: true
validates :tel, phone_number: true
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abookyun/taiwan_validator.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
