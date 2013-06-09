# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdota/version'

Gem::Specification.new do |spec|
  spec.name          = "rdota"
  spec.version       = Rdota::VERSION
  spec.authors       = ["David Wu"]
  spec.email         = ["davidcnwu@gmail.com"]
  spec.description   = %q{Ruby Dota 2 API}
  spec.summary       = %q{A Ruby wrapper for the Dota 2 API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
end
