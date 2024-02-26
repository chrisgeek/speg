# Speg
Have you tried to add test coverage to an existing codebase? Imagine how tedious it is to manaully create each test/spec file?
This gem automagically generates and sets up test/spec files, you do not have to spend time creating each file manaully, it reads your file structure and genrates the files accordingly.

## Example
In the model directory, if a file `models/user.rb` exists, the corresponding spec file will be generated at `spec/models/users_spec.rb` or `test/models/users_test.rb`, depending on whether you are using Rspec or Minitest. It also generates files in controllers, helpers, adapters and services directory.
Assume you are using Rspec, the `user_spec.rb` file will contain, then you can continue with writing actual tests!

```
RSpec.describe User do
end
```

## Installation

`$ gem install speg`

OR

Add to your Gemfile `gem 'speg'`

Run bundle install

## Usage

## For Rspec
if your test framework is Rspec, ensure you have rspec installed and setup.

Run `$ speg --rspec`

The command will generate spec files into your spec directory. 

## For Minitest
if your test framework is Minitest, ensure you have minitest setup.

Run `$ speg --minitest`

The command will generate test files into your test directory. 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chrisgeek/speg. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/chrisgeek/speg/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Speg project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/chrisgeek/speg/blob/main/CODE_OF_CONDUCT.md).
