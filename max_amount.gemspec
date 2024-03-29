# frozen_string_literal: true

require_relative 'lib/max_amount/version'

Gem::Specification.new do |spec|
  spec.name = 'max_amount'
  spec.version = MaxAmount::VERSION
  spec.authors = ['Gleb V. Zhegulin']
  spec.email = ['gleboceanborn@gmail.com']
  spec.summary = 'Reading text data and outputting the n largest integers encountered in the received text data.'
  spec.description = 'Reading text data and outputting the n largest integers encountered in the received text data.
                     When input is complete, prints the n largest integers.'
  spec.homepage = 'https://github.com/ProfessorNemo/max_amount'
  spec.license = 'MIT'
  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = '>= 3.0.3'
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage

  spec.add_dependency 'optparse'
  spec.add_dependency 'securerandom'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.extra_rdoc_files = ['README.md']
  spec.require_paths = ['lib']
  spec.metadata['rubygems_mfa_required'] = 'true'
end
