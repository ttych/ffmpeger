# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ffmpeger/version'

Gem::Specification.new do |spec|
  spec.name          = 'FFmpeger'
  spec.version       = FFmpeger::VERSION
  spec.authors       = ['Thomas Tych']
  spec.email         = ['thomas.tych@gmail.com']

  spec.summary       = 'FFmpeg wrapper.'
  spec.description   = 'Juste a FFpmpeg wrapper.'
  spec.homepage      = 'https://gitlab.com/ttych/ffmpeger'
  spec.license       = 'MIT'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://gitlab.com/ttych/ffmpeger'
  spec.metadata['changelog_uri'] = 'https://gitlab.com/ttych/ffmpeger/CHANGELOG.md'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem
  #  that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0")
                     .reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.77.0'
  spec.add_development_dependency 'rubocop-rspec', '~> 1.37'
end
