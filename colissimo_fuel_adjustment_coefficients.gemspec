Gem::Specification.new do |s|
  s.name        = "colissimo_fuel_adjustment_coefficients"
  s.version     = "0.3.0"
  s.authors     = ["Bob Maerten", "Clément Joubert"]
  s.email       = ["bob@levups.com", "clement@levups.com"]

  s.date        = "2018-11-16"
  s.summary     = "Retrieve current month's Colissimo's fuel surcharges"
  s.description = "A simple gem to ease/automate getting this data every month."
  s.homepage    = "https://rubygems.org/gems/colissimo_fuel_adjustment_coefficients"
  s.license     = "MIT"

  s.metadata = {
    "bugtracker_uri" => "https://github.com/levups/colissimo_fuel_adjustment_coefficient/issues",
    "homepage_uri" => "https://rubygems.org/gems/colissimo_fuel_adjustment_coefficients",
    "source_code_uri" => "https://github.com/levups/colissimo_fuel_adjustment_coefficients",
    "changelog_uri" => "https://github.com/levups/colissimo_fuel_adjustment_coefficients/blob/master/CHANGELOG.md"
  }

  s.bindir        = "exe"
  s.executables   = "colissimo_fuel_adjustment_coefficients"
  s.require_paths = ["lib"]
  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  # Signature config
  s.cert_chain  = ["certs/bob_levups.pem"]
  s.signing_key = File.expand_path("~/.ssh/bob_levups-gem-private_key.pem") if $PROGRAM_NAME.end_with?("gem")

  s.add_dependency "http", "~> 4.0"

  s.add_development_dependency "bundler", "~> 1.17"
  s.add_development_dependency "minitest", "~> 5.1"
  s.add_development_dependency "minitest-stub_any_instance", "~> 1.0"
  s.add_development_dependency "rake", "~> 12.3"
end
