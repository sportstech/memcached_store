autoload :Memcached, 'memcached'

module ActiveSupport
  module Cache
    autoload :MemcachedStore, 'active_support/cache/memcached_store'
  end
end