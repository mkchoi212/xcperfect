lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xcperfect/version'

Gem::Specification.new do |spec|
  spec.name          = 'xcperfect'
  spec.version       = XCPerfect::VERSION
  spec.authors       = ['Mike JS. Choi']
  spec.email         = ['mkchoi212@icloud.com']
  spec.required_ruby_version = '>= 2.0.0'
  spec.description =
    %q{
    Formatter for Apple's xccov json output because who doesn't
    like pretty outputs? Am I rite?
    }
  spec.summary       = %q(Make your xccov outputs prettier)
  spec.homepage      = 'https://github.com/mkchoi212/xcperfect'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rouge', '~> 2.0.7'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop', '~> 0.34.0'
end
