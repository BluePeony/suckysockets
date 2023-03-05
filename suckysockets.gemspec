
Gem::Specification.new do |s|
  s.name         = "suckysockets"
  s.version      = "1.0.0"
  s.author       = "BluePeony"
  s.email        = "blue.peony2314@gmail.com"
  s.homepage     = "https://github.com/BluePeony/suckysockets"
  s.summary      = "Command line tool to check whether a power adapter is needed when travelling from country A to country B"
  s.description  = File.read(File.join(File.dirname(__FILE__), 'README'))
  s.licenses     = ['MIT']

  s.files         = Dir["{bin,lib,spec}/**/*"] + %w(LICENSE README)
  s.test_files    = Dir["spec/**/*"]
  s.executables   = [ 'suckysockets' ]

  s.required_ruby_version = '>=1.9'
  s.add_development_dependency 'rspec', '~> 2.8', '>= 2.8.0'
end
