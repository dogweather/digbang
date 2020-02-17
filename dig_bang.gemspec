# coding: utf-8
# frozen_string_literal: true
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dig_bang/version'

Gem::Specification.new do |spec|
  spec.name          = 'dig_bang'
  spec.version       = DigBang::VERSION
  spec.authors       = ['Robb Shecter']
  spec.email         = ['robb@weblaws.org']

  spec.summary       = 'Like #dig but raises an exception for key not found.'
  spec.description   = 'Ruby 2.3 introduces the new Hash#dig method for safe ' \
                       'extraction of a nested value. It is the equivalent of ' \
                       'a safely repeated Hash#[] or Array#[]. #dig! on the ' \
                       'other hand, is a repeated #fetch.'
  spec.homepage      = 'https://github.com/dogweather/digbang'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.1.4'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
