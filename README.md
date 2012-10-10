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
In `config/environments/<environment>.rb`, add this:

#### For a single memcached server

    require 'memcached_store'
    config.cache_store = :memcached_store, '127.0.0.1:11211', { :namespace => "production" }

#### For multiple memcached servers, you can pass an array:

    require 'memcached_store'
    config.cache_store = :memcached_store, ['10.0.0.1:11211', '10.0.0.2:11211']
    
#### Any options:

    require 'memcached_store'
    config.cache_store = :memcached_store, ['10.0.0.1:11211', '10.0.0.2:11211'], { :namespace => 'production', :default_ttl => 15.minutes.to_i }

See [the memcached documentation](https://github.com/evan/memcached/blob/master/lib/memcached/memcached.rb) for configuration options.

## Notes

This adds the dependency load fix patch to `ActiveSupport::Cache::Store`.

See [this comment](http://thewebfellas.com/blog/2008/6/9/rails-2-1-now-with-better-integrated-caching#comment-1171) for an idea of what this patch does.

## TODO

* Write tests
* Implement multi_get


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
