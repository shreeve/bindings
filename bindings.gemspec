# encoding: utf-8

Gem::Specification.new do |s|
  s.name        = "bindings"
  s.version     = "0.9"
  s.summary     = "Access bindings of calling methods (uses fiddle instead of C calls)."
  s.description = <<-EOT
This gem allows the bindings of calling methods to be accessed without a C extension.
It does this by using fiddle, Ruby's built-in support for accessing native C methods.
Using this gem, you can easily access variables from calling methods, which makes it
very easy to implement templating system or other utilities that need similar access.
EOT
  s.homepage    = "https://github.com/shreeve/bindings"
  s.authors     = ["Steve Shreeve"]
  s.email       = "steve.shreeve@gmail.com"
  s.license     = "MIT"
  s.files       = `git ls-files`.split("\n") - %w[.gitignore]
  s.platform    = Gem::Platform::RUBY
  s.cert_chain  = ["certs/shreeve.pem"]
  s.signing_key = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/
end
