# GConfig

Easy configuration gem.

## Installation

```ruby
gem 'gconfig'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gconfig

## Usage

```
require 'gconfig'

module MyModule
	extend GConfig
	default mailer_sender: 'toto@example.com', age: 3
	default name: 'Nicolas'
	default last_name: 'Dulac'

	...
end

MyModule.config do |config|
  config.mailer_sender = 'donotreply@example.com'
end

puts MyModule.config.mailer_sender
puts MyModule.config.age

```


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
