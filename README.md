# MemcachedStore

Rails 2.3 ActiveSupport Cache Store for http://github.com/evan/memcached.

A drop-in replacement for ActiveSupport 2.3's built-in MemCacheStore that uses the native memcached gem

## Installation

Add this line to your application's Gemfile:

    gem 'memcached_store'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install memcached_store

## Usage
In `config/application.rb`, add this:

#### For a single memcached server

    config.cache_store = :memcached_store, '127.0.0.1:11211', { :namespace => "production" }

#### For multiple memcached servers, you can pass an array:

    config.cache_store = :memcached_store, ['10.0.0.1:11211', '10.0.0.2:11211']

See http://github.com/evan/memcached for configuration options.

## TODO

* Write tests
* Implement multi_get


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
