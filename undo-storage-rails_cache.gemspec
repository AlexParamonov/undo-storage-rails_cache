# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "undo-storage-rails_cache"
  spec.version       = IO.read("VERSION")
  spec.authors       = ["Alexander Paramonov"]
  spec.email         = ["alexander.n.paramonov@gmail.com"]
  spec.summary       = %q{Rails.cache storage adapter for Undo}
  spec.description   = %q{
Rails.cache storage adapter for Undo. Does not depend on Rails and can
be used with any similarly quaking storage.
  }
  spec.homepage      = "http://github.com/AlexParamonov/undo-storage-rails_cache"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "undo", "~> 1.0"
  spec.add_development_dependency "bundler", "~> 1.0"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", ">= 3.0.0.beta1"
end
