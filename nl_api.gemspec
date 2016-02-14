# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nl_api/version'

Gem::Specification.new do |spec|
  spec.name          = "nl_api"
  spec.version       = NlApi::VERSION
  spec.authors       = ["Maarten van Vliet"]
  spec.email         = ["maartenvanvliet@gmail.com"]

  spec.summary       = %q{Simple wrapper for CBS municipality data}
  spec.description   = %q{Simple wrapper for CBS municipality data. Useful for finding province/municipalities by their codes or vice versa}
  spec.homepage      = "https://gitlab.com/maartenvanvliet/nl_api"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
