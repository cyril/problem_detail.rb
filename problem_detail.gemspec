Gem::Specification.new do |spec|
  spec.name          = 'problem_detail'
  spec.version       = File.read('VERSION.semver').chomp
  spec.authors       = ['Cyril Wack']
  spec.email         = ['contact@cyril.email']

  spec.summary       = 'Problem Details for HTTP APIs.'
  spec.description   = 'A "problem detail" as a way to carry machine-readable' \
                       ' details of errors in a HTTP response, to avoid the'   \
                       ' need to define new error response formats for HTTP'   \
                       ' APIs.'
  spec.homepage      = 'https://github.com/cyril/problem_detail.rb'
  spec.license       = 'MIT'

  spec.files         =
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^test/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'fix',                    '~> 0.17.0'

  spec.add_development_dependency 'bundler',    '~> 1.10'
  spec.add_development_dependency 'rake',       '~> 10.4'
  spec.add_development_dependency 'yard',       '~> 0.8'
  spec.add_development_dependency 'simplecov',  '~> 0.10'
  spec.add_development_dependency 'rubocop',    '~> 0.35'

  spec.cert_chain   = ['certs/gem-cyril-public_cert.pem']
  private_key       = File.expand_path('~/.ssh/gem-cyril-private_key.pem')
  spec.signing_key  = private_key if File.exist?(private_key)
end
