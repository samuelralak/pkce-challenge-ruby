# PKCE Code challenge generator

PKCE flow code verifier and code challenge **generator**

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pkce_challenge'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pkce_challenge

## Usage

To generate the code verifier and challenge simply run:

```ruby
PkceChallenge.challenge
```

Or with the char length option:

```ruby
PkceChallenge.challenge(char_length: 128)
```

Additionally you can run:
```ruby
pkce_challenge = PkceChallenge.challenge 
pkce_challenge = PkceChallenge.challenge(char_length: 128) # or with char_length option
```

Returned value is an instance of PkceChallenge::Challenge class which will have the following methods:
```ruby
pkce_challenge.code_verifier # a dynamically created cryptographically random key
pkce_challenge.code_challenge # a BASE64-URL-encoded string of the SHA256 hash of the code verifier
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/samuelralak/pkce_challenge. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PkceChallenge project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pkce_challenge/blob/master/CODE_OF_CONDUCT.md).
