# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gem_checksum/version'

Gem::Specification.new do |spec|
  spec.name          = "gem-checksum"
  spec.version       = GemChecksum::VERSION
  spec.authors       = ["Benjamin Fleischer"]
  spec.email         = ["github@benjaminfleischer.com"]
  spec.description   = %q{gem checksum [gem]}
  spec.summary       = %q{calculates and verifies checksums for rubygems}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end