autoload :Memcached, 'memcached'

module ActiveSupport
  # See ActiveSupport::Cache::Store for documentation.
  module Cache
    autoload :MemcachedStore, 'active_support/cache/memcached_store'
  end
end