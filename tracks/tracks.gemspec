# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tracks/version'

Gem::Specification.new do |spec|
  spec.name          = "tracks"
  spec.version       = Tracks::VERSION
  spec.authors       = ["Michael Fagan"]
  spec.email         = ["michaelfagan@bitmakerlabs.com"]
  spec.description   = %q{Web framework}
  spec.summary       = %q{Micro web framework for Ruby, built on Rack}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rack-test"

  spec.add_runtime_dependency "erubis"
  spec.add_runtime_dependency "rack"
  spec.add_runtime_dependency "multi_json"
  spec.add_runtime_dependency "sqlite3"
end
