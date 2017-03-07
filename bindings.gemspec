# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = "bindings"
  s.version     = "1.0.0"
  s.author      = "Steve Shreeve"
  s.email       = "steve.shreeve@gmail.com"
  s.summary     = "Access the lexical binding scope of a calling method"
  s.description = "This gem lets you access variables from a calling method."
  s.homepage    = "https://github.com/shreeve/bindings"
  s.license     = "MIT"
  s.platform    = Gem::Platform::RUBY
  s.files       = `git ls-files`.split("\n") - %w[.gitignore]
  s.extensions << 'ext/bindings/extconf.rb'
  s.add_development_dependency "bundler", "~> 1.5"
  s.add_development_dependency "rake"
  s.add_development_dependency "rake-compiler"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
end
