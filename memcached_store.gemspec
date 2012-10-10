# -*- encoding: utf-8 -*-
# require File.expand_path('../lib/memcached_store/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Quinn"]
  gem.email         = ["chaffeqa@gmail.com"]
  gem.description   = %q{Rails 2.3 ActiveSupport Cache Store for http://github.com/evan/memcached}
  gem.summary       = %q{A drop-in replacement for ActiveSupport 2.3's built-in MemCacheStore that uses the native memcached gem}
  gem.homepage      = "https://github.com/sportstech/memcached_store"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "memcached_store"
  gem.require_paths = ["lib"]
  gem.version       = "0.0.2"
  gem.add_dependency 'memcached'
end
