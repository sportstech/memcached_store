# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'memcached_store/version'

Gem::Specification.new do |spec|
  spec.name          = "memcached_store"
  spec.version       = MemcachedStore::VERSION
  spec.authors       = ["Quinn", "Jared Hales"]
  spec.email         = ["developers@sportstechinc.com"]
  spec.description   = %q{A drop-in replacement for ActiveSupport's built-in MemCacheStore that uses the native memcached gem}
  spec.summary       = %q{ActiveSupport Cache Store for http://github.com/evan/memcached}
  spec.homepage      = "https://github.com/sportstech/memcached_store"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  
  spec.add_dependency 'memcached', '>= 1.2.7'
  spec.add_dependency 'activesupport', '>= 3.0.5'
  spec.add_dependency 'actionpack', '>= 3.0.5'
end