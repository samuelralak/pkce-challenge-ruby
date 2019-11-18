# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pkce_challenge/version"

Gem::Specification.new do |spec|
  spec.name = "pkce_challenge"
  spec.version = PkceChallenge::VERSION
  spec.authors = ["Samuel Ralak"]
  spec.email = ["thesamuelralak@gmail.com"]

  spec.summary = "PKCE flow code verifier and code challenge generator"
  spec.description = "PKCE flow code verifier and code challenge generator"
  spec.homepage = "https://github.com/samuelralak/pkce-challenge-ruby"
  spec.license = "MIT"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.17"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", "~> 0.17.1"
end
