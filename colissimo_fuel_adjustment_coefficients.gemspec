# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'colissimo_fuel_adjustment_coefficients'
  s.version     = '0.2.0'
  s.date        = '2018-11-14'
  s.summary     =
    "Retrieve current month's Colissimo's fuel adjustment coefficients"
  s.description = 'A simple gem to ease/automate getting this data every month.'
  s.authors     = ['Bob Maerten', 'Clément Joubert']
  s.files       =
    Dir.glob('{bin,lib}/**/*') + %w[LICENSE README.md CHANGELOG.md]
  s.email       = ['bob.maerten@gmail.com', 'clement.joubert@gmail.com']
  s.homepage    = 'https://rubygems.org/gems/colissimo_fuel_adjustment_coefficients'
  s.license     = 'MIT'

  s.bindir      = 'bin'
  s.executables = 'colissimo_fuel_adjustment_coefficients'

  s.add_dependency 'http', '~> 4.0'
  s.add_dependency 'oga',  '~> 2.10'

  s.add_development_dependency 'minitest', '~> 5.1'
  s.add_development_dependency 'minitest-stub_any_instance', '~> 1.0'
  s.add_development_dependency 'rake', '~> 12.3'
end
