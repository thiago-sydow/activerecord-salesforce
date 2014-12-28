# ActiveRecord::Salesforce

ActiveRecord::Salesforce wraps the communication between your app and salesforce.
Configure and use for any type of salesforce object (Lead, Contact, Account, etc.)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-salesforce'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-salesforce

## Usage

1. Create a class and include the module ActiveRecord::Salesforce::Base
2. Map the Salesforce model and attributes (example in examples/person.rb)
3. Create a config file with salesforce details (example in examples/config/salesforce.yml)
4. Call save_in_salesforce(config) to create the object in salesforce (config should be one item from salesforce.yml file)


## Contributing

1. Fork it ( https://github.com/thiago-sydow/activerecord-salesforce/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
