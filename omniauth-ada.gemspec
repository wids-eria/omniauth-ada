# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-ada/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Bendyworks Pair"]
  gem.email         = ["dev@bendyworks.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "omniauth-ada"
  gem.require_paths = ["lib"]
  gem.version       = Omniauth::Ada::VERSION
  gem.add_dependency 'omniauth'
  gem.add_dependency 'omniauth-oauth2'
end
