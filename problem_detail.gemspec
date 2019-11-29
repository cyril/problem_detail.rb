# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name         = 'problem_detail'
  spec.version      = File.read('VERSION.semver').chomp
  spec.author       = 'Cyril Kato'
  spec.email        = 'contact@cyril.email'
  spec.summary      = 'Problem Details for HTTP APIs.'
  spec.description  = 'A "problem detail" as a way to carry machine-readable' \
                       ' details of errors in a HTTP response, to avoid the'  \
                       ' need to define new error response formats for HTTP'  \
                       ' APIs.'
  spec.homepage     = 'https://github.com/cyril/problem_detail.rb'
  spec.license      = 'MIT'
  spec.files        = Dir['LICENSE.md', 'README.md', 'lib/**/*']

  spec.add_development_dependency 'bundler',    '~> 2.0'
  spec.add_development_dependency 'rake',       '~> 13.0'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'rubocop-performance'
  spec.add_development_dependency 'simplecov',  '~> 0.17'
  spec.add_development_dependency 'yard',       '~> 0.9'
end
