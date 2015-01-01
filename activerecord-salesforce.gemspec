# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/salesforce/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-salesforce"
  spec.version       = ActiveRecord::Salesforce::VERSION
  spec.authors       = ["Thiago von Sydow"]
  spec.email         = ["thiagovs05@gmail.com"]
  spec.summary       = %q{ActiveRecord::Salesforce wraps the communication between your app and salesforce.}
  spec.homepage      = "https://github.com/thiago-sydow/activerecord-salesforce"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "databasedotcom"
  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "simplecov"
end
