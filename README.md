# Rack::Synctime

Rack::Synctime is a simple Rack middleware that returns sync time (time when request started) in HTTP headers. Header name can be changed also sync time can be modified using time offset i.e. -5 seconds (server time in seconds decreased by 5) etc. This can be useful if you develop mobile applications (Android, iOS, ...) and you need information when request started in response header.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-synctime'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-synctime

## Usage

Put the following line in your application.rb file:

```ruby
config.middleware.use Rack::Synctime
```

Custom header name:

```ruby
config.middleware.use Rack::Synctime, "Custom-Header-Name"
```

Time offset:

```ruby
config.middleware.use Rack::Synctime, Rack::Synctime::DEFAULT_HEADER_NAME, -3600 # server time -1 hour
```

## Note
In Rails app sync time header name might be transformed into capitalized string by other mechanisms. So if you use custom header name make sure you have expected result.

## Demo
TODO


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
