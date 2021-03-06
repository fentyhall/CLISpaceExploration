require_relative 'lib/space_exploration/version'

Gem::Specification.new do |spec|
  spec.name          = "space_exploration"
  spec.version       = SpaceExploration::VERSION
  spec.authors       = ["fentyhall"]
  spec.email         = ["fentymhall@gmail.com"]

  spec.summary       = %q{space exploration}
  spec.description   = %q{space exploration has 3 main classes, along with cli and api classes}
  spec.homepage      = "https://github.com/fentyhall/mod1_cli_space_exploration"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://github.com/fentyhall/mod1_cli_space_exploration"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/fentyhall/mod1_cli_space_exploration"
  spec.metadata["changelog_uri"] = "https://github.com/fentyhall/mod1_cli_space_exploration"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.4"
  spec.add_development_dependency "pry"
  spec.add_dependency "colorize", '~> 0.8.1'
  spec.add_dependency "require_all"
  # spec.add_dependency "open-uri"
  # spec.add_dependency "net/http"
  # spec.add_dependency "json"

end
