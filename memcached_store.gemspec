# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

Gem::Specification.new do |s|
  s.name = "memcached_store"
  s.version = '0.9.5'
  s.platform = Gem::Platform::RUBY
  s.authors = ["Lourens Naudé", "Pivotal Labs", "Friendster"]
  s.homepage = "https://github.com/pivotalneutron/memcached_store"
  s.summary = "ActiveSupport Cache Store for http://github.com/fauna/memcached "
  s.description = "A drop-in replacement for ActiveSupport's built-in MemCacheStore that uses the native memcached gem"
  s.required_rubygems_version = ">= 1.7.2"
  s.files = Dir.glob("lib/**/*") + %w(memcached_store.rb MIT-LICENSE README.md)
  s.require_path = 'lib'
  s.add_dependency 'memcached', '>= 1.2.7'
  s.add_dependency 'activesupport', '>= 3.0.5'
end