# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'contact_agent/version'

Gem::Specification.new do |spec|
  spec.name          = "contact_agent"
  spec.version       = ContactAgent::VERSION
  spec.authors       = ["Franklin Webber"]
  spec.email         = ["franklin.webber@gmail.com"]
  spec.description   = %q{Able to interact the Contact Manager API}
  spec.summary       = %q{Client for Contact Manager}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "oj"
  spec.add_dependency "multi_json"
  spec.add_dependency "faraday"
  spec.add_dependency "hashie"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
