require 'memcached'

module ActiveSupport
  module Cache
    class MemcachedStore < Store

      attr_reader :addresses

      def initialize(*addresses)
        addresses = addresses.flatten
        @options = addresses.extract_options!
        addresses = ["localhost:11211"] if addresses.empty?
        @addresses = addresses
        @data = Memcached.new(addresses, @options)
        extend Strategy::LocalCache
      end

      def increment(key, amount = 1)
        with_safety do
          begin
            log("incrementing", key, amount)

            @data.incr(expand_cache_key( key ), amount)
          rescue Memcached::NotFound => e
            nil
          end
        end
      end

      def decrement(key, amount = 1)
        with_safety do
          begin
            log("decrement", key, amount)

            @data.decr(expand_cache_key( key ), amount)
          rescue Memcached::NotFound => e
            nil
          end
        end
      end

      def clear(options = nil)
        with_safety do
          @data.flush
        end
      end

      def stats
        with_safety( {} ) do
          @data.stats
        end
      end

      def reset
        @data.reset
      end

      protected

      def read_entry(key, options = nil)
        with_safety do
          begin
            @data.get(expand_cache_key(key), raw?(options))
          rescue Memcached::NotFound => e
            nil
          end
        end
      end

      # Set key = value. Pass :unless_exist => true if you don't
      # want to update the cache if the key is already set.
      def write_entry(key, value, options = nil)
        with_safety(false) do
          begin
            method = options && options[:unless_exist] ? :add : :set
            @data.send(method, expand_cache_key(key), value, expires_in(options), raw?(options))
            true
          rescue Memcached::NotStored => e
            logger.error("[write:#{key}] MemcachedError (#{e}): #{e.message}")
            false
          end
        end
      end

      def delete_entry(key, options = nil)
        with_safety(false) do
          begin
            @data.delete(expand_cache_key(key))
            true
          rescue Memcached::NotFound => e
            logger.error("[delete:#{key}] MemcachedError (#{e}): #{e.message}")
            false
          end
        end
      end

      private

      def logger
        ::Rails.logger
      end

      def with_safety( return_value = nil )
        begin
          yield
        rescue Memcached::Error => exception
          logger.error("MemcachedError (#{exception}): #{exception.message}")
          return_value
        end
      end

      def expand_cache_key( key )
        ActiveSupport::Cache.expand_cache_key( key, @options[:namespace] )
      end

      def expires_in(options)
        ((options && options[:expires_in]) || 0).to_i
      end

      def raw?(options)
        !( options && options[:raw] )
      end
    end
  end
end
