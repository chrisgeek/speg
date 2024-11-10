# frozen_string_literal: true

require_relative 'lib/speg/version'

Gem::Specification.new do |spec|
  spec.name = 'speg'
  spec.version = Speg::Version::VERSION
  spec.authors = ['Opara Ifeanyi Christian']
  spec.email = ['chrisgeek29@gmail.com']
  spec.summary = 'Create spec/test files for your test framework'
  spec.description = 'This gem creates test/spec files that were not created automatically with rspec/minitest, this is especially helpful if you have to generate multiple test files'
  spec.homepage = 'https://github.com/chrisgeek/speg'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 2.6.0'
  spec.files = Dir.glob('{lib,bin,spec}/**/*')
  spec.add_dependency 'railties', '~> 8.0'
  spec.executables = ['speg']

#   spec.metadata[allowed_push_host'] = 'TODO: Set to your gem server https://example.com'

#   spec.metadata['homepage_uri'] = spec.homepage
#   spec.metadata['source_code_uri'] = 'TODO: Put your gems public repo URL here.'
#   spec.metadata['changelog_uri'] = 'TODO: Put your gems CHANGELOG.md URL here.'
  spec.metadata    = {
    'homepage_uri'      => 'https://github.com/chrisgeek/speg',
    'documentation_uri' => 'https://rubydoc.info/github/chrisgeek/speg',
    'changelog_uri'     => 'https://github.com/chrisgeek/speg/blob/main/CHANGELOG.md',
    'source_code_uri'   => 'https://github.com/chrisgeek/speg',
    'bug_tracker_uri'   => 'https://github.com/chrisgeek/speg/issues',
    'wiki_uri'          => 'https://github.com/chrisgeek/speg/wiki'
    }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  # spec.files = Dir.chdir(__dir__) do
  #   `git ls-files -z`.split('\x0').reject do |f|
  #     (File.expand_path(f) == __FILE__) ||
  #       f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
  #   end
  # end
  # spec.bindir = 'exe'
  # spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  # spec.require_paths = ['lib']

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
