# Unisms

This gem provides a unified interface to let users dealing with SMS.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'unisms'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unisms

## Usage

Basic example: Print the SMS to STDOUT
```ruby
sms = Unisms.new
phone_number = '+886999999999' # the phone number should be international format
sms.deliver 'hello', to: phone_number
```

Using Nexmo to send SMS
```ruby
nexmo_adapter = Unisms::Adapter::Nexmo.new 'nexmo-api-key', 'nexmo-api-secret'
sms = Unisms.new nexmo_adapter
phone_number = '+886999999999' # the phone number should be international format
sms.deliver 'hello', to: phone_number
```

Using Kotsms to send SMS
```ruby
kotsms_adapter = Unisms::Adapter::Kotsms.new 'kotsms-username', 'kotsms-password'
sms = Unisms.new kotsms_adapter
phone_number = '+886999999999'
sms.deliver 'hello', to: phone_number
```

Sending message randomly by Nexmo or Kotsms
```ruby
nexmo_adapter = Unisms::Adapter::Nexmo.new 'nexmo-api-key', 'nexmo-api-secret'
kotsms_adapter = Unisms::Adapter::Kotsms.new 'kotsms-username', 'kotsms-password'
random_router = Unisms::Router::Random.new [nexmo_adapter, kotsms_adapter]
sms = Unisms.new random_router
phone_number = '+886999999999'
sms.deliver 'hello', to: phone_number
```

Sending message: to Taiwan by Kotsms, and else by Nexmo using custom router
```ruby
class TaiwanOptimizedRouter < Unisms::Router::Base
	def initialize
		@nexmo_adapter = Unisms::Adapter::Nexmo.new 'nexmo-api-key', 'nexmo-api-secret'
		@kotsms_adapter = Unisms::Adapter::Kotsms.new 'kotsms-username', 'kotsms-password'
	end

	def route(message, to: nil, from: nil)
		if /\+886.*/ === to
			@kotsms_adapter
		else
			@nexmo_adapter
		end
	end
end

router = TaiwanOptimizedRouter.new
sms = Unisms.new router
sms.deliver '哈囉! Taiwan NO.1!', to: '+886999999999'
sms.deliver 'hello', to: '+1999999999' # I don't know the format of US
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake false` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/CrBoy/unisms.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

