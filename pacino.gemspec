# -*- encoding: utf-8 -*-
require File.expand_path('../lib/pacino/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "pacino"
  gem.version       = Pacino::VERSION
  gem.authors       = ["Jack Polgar"]
  gem.email         = ["nrx@nirix.net"]
  gem.summary       = "Simple little blog."
  gem.description   = "Simple little blog powered by Sinatra."
  gem.homepage      = "https://github.com/nirix/pacino"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  
  gem.add_dependency 'sinatra', '~> 1.3.2'
  gem.add_dependency 'rocketeer', '~> 0.4.0'
  gem.add_dependency 'redcarpet', '~> 2.1.1'
end
