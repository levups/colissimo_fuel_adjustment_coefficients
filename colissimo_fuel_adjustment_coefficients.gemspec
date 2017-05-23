Gem::Specification.new do |s|
  s.name        = 'colissimo_fuel_adjustment_coefficients'
  s.version     = '0.1.0'
  s.date        = '2017-05-23'
  s.summary     = "Retrieve current month's Colissim'os fuel adjustment coefficients"
  s.description = 'A simple gem to ease/automate getting this data every month.'
  s.authors     = ['Bob Maerten', 'Clément Joubert']
  s.files       = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.md CHANGELOG.md)
  s.email       = ['bob.maerten@gmail.com', 'clement.joubert@gmail.com']
  s.homepage    = 'https://rubygems.org/gems/colissimo_fuel_adjustment_coefficients'
  s.license     = 'MIT'

  s.bindir      = 'bin'
  s.executables = 'colissimo_fuel_adjustment_coefficients'

  s.add_runtime_dependency 'addressable', '~> 2.5'
  s.add_runtime_dependency 'httparty',    '~> 0.15'
  s.add_runtime_dependency 'oga',         '~> 2.10'
end
