require File.expand_path("lib/character_enumerator/version", __dir__)

Gem::Specification.new do |spec|
  spec.name = "character_enumerator"
  spec.version = CharacterEnumerator::VERSION
  spec.authors = ["Krists Ozols"]
  spec.email = ["krists.ozols@gmail.com"]
  spec.summary = "Ruby enumerator that converts integers to character representation(Like in Microsoft Excel - A, B, C, .. Z, AA, AB)"
  spec.homepage = "https://github.com/krists/character_enumerator"
  spec.license = "MIT"
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.files = Dir["lib/**/*.rb"]
  spec.require_paths = ["lib"]
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4")
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
