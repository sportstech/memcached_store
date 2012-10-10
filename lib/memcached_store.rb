autoload :Memcached, 'memcached'

# Fix for fetch when cache_classes is false
require 'active_support/cache/patches/dependency_load_fix'

module ActiveSupport
  module Cache
    autoload :MemcachedStore, 'active_support/cache/memcached_store'
    
    class Store
      include Patches::DependencyLoadFix if ActiveSupport::Dependencies.mechanism == :load
    end
  end
end