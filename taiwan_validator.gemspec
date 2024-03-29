# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'taiwan_validator/version'

Gem::Specification.new do |spec|
  spec.name          = "taiwan_validator"
  spec.version       = TaiwanValidator::VERSION
  spec.authors       = ["David Yun"]
  spec.email         = ["abookyun@gmail.com"]

  spec.summary       = %q{Collection of useful custom validators in Taiwan for Rails applications}
  spec.description   = %q{taiwan_validator provides a set of commonly used validators in Taiwan for Rails applications}
  spec.homepage      = "https://github.com/abookyun/taiwan_validator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel", ">= 4.2"
  spec.add_dependency "activesupport", ">= 4.2"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
