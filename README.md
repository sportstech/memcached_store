# MemcachedStore (Rails 2 Version)

[Rails 3 Version](https://github.com/sportstech/memcached_store)
[Rails 2 Version](https://github.com/sportstech/memcached_store/tree/rails_2)

*Rails 2.3.11+* ActiveSupport Cache Store for http://github.com/evan/memcached.

A drop-in replacement for ActiveSupport 2.3's built-in MemCacheStore that uses the native memcached gem

## Installation

Add this line to your application's Gemfile:

    gem 'memcached_store', :git => 'git://github.com/sportstech/memcached_store.git', :branch => 'rails_2'


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

You may need to add the following development fix: (was formerly bundled in `cache-contrib` plugin):

```ruby
# config/initializers/patches/dependency_load_fix
if ActiveSupport::Dependencies.mechanism == :load
  module ActiveSupport
    module Cache
      module Patches
        module DependencyLoadFix
          def self.included(base)
            super
            base.alias_method_chain :fetch, :dependency_load_fix
          end

          def fetch_with_dependency_load_fix(*arguments)
            block_given? ? yield : fetch_without_dependency_load_fix(*arguments)
          end
        end
      end
    end
  end
end
```

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
