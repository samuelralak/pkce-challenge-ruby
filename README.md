# PkceChallenge

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/pkce_challenge`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

```ruby
2.6.0 :001 > require "pkce_challenge"
```

```ruby
2.6.0 :001 > PkceChallenge.challenge
```

Output:
```ruby
=> #<PkceChallenge::Challenge:0x00007f894f810378 @char_length=48, @code_verifier="QbS08cDO9pce~HVCKe9-UDiJoBMG8xwql4FI.Y3CIdpyJtPU", @code_challenge="HT90mmypkXgneRUVK-Ja009VvnoL-flydbEgRcTp5Yw">
```

Generating a code challenge with the `char_length` option:
```ruby
# Accepts valid length between 43 and 128

2.6.0 :003 > PkceChallenge.challenge(char_length: 50)

 => #<PkceChallenge::Challenge:0x00007f894f20b9a0 @char_length=50, @code_verifier="0St0oCRzGDFj_iIxB8PCwaMPvGLk8vQxDfJIoC_zU56XwwQM21", @code_challenge="01g9RYPZOjpVFB-BBQhd6OC70jlgPFzJ6ie5YkSC7rI">
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/pkce_challenge. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PkceChallenge project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/pkce_challenge/blob/master/CODE_OF_CONDUCT.md).
