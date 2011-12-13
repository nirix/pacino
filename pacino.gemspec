require File.expand_path('../lib/pacino/version', __FILE__)

path = File.expand_path('../', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'pacino'
  s.version     = Pacino::VERSION
  s.date        = '2011-12-11'
  s.authors     = ['Jack Polgar']
  s.email       = 'nrx@gxr.co'
  s.summary     = 'Pacino is a simple Sinatra powered blog/cms.'
  s.homepage    = 'https://github.com/nirix/pacino'
  s.description = 'Pacino is a simple Sinatra powered blog/cms system designed to be fast and easy to use.'

  s.files = `git ls-files`.split("\n").sort
  s.required_ruby_version = '>= 1.9.2'

  s.add_dependency('sequel', ['~> 3.30.0'])
  s.add_dependency('sinatra', ['~> 1.3.1'])
  s.add_dependency('rocketeer', ['~> 0.3.0'])
  s.add_dependency('bcrypt-ruby')
end