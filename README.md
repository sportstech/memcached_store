# ActiveSupport Memcached Cache Store
Drop-in replacement for ActiveSupport::Cache::MemCacheStore powered by [Evan Weaver's Memcached](http://github.com/fauna/memcached)

## Installation

#### Using Bundler

    gem 'memcached_store'

#### The old-skool way

    gem install memcached_store

## Usage
In `config/application.rb`, add this:

#### For a single memcached server

    config.cache_store = :memcached_store, '127.0.0.1:11211', { :namespace => "production" }

#### For multiple memcached servers, you can pass an array:

    config.cache_store = :memcached_store, ['10.0.0.1:11211', '10.0.0.2:11211']

See http://github.com/fauna/memcached for configuration options.

## TODO

* Write tests
* Implement multi_get

Copyright (c) 2008-2011 Lourens Naudé, [Pivotal Labs](http://pivotallabs.com), [Friendster Inc.](http://friendster.com). Released under the MIT license
