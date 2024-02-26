require 'rails/generators'
require 'optparse'
require_relative 'templates'
require_relative 'file_paths'

module Speg
  class FileGenerator < Rails::Generators::Base
    include Templates
    include FilePaths

    PATHS = %w[app/models app/controllers app/helpers app/services app/adapters].freeze

    def create_files
      @option_parser = OptionParser.new
      @option_parser.on('--rspec', 'Generate Rspec files') { generate_test_files('spec') }

      @option_parser.on('--minitest', 'Generate Minitest files') { generate_test_files('test') }

      if ARGV.empty?
        puts @option_parser.help
        exit
      end

      @option_parser.parse!
    end

    def generate_test_files(file_suffix)
      PATHS.each do |path|
        next unless Dir.exist?(path)

        file_paths(path).each do |dir|
          file_path = dir.split('/')
          file_name = "#{file_path.last.split('.').first}_#{file_suffix}.rb"
          klass_name = File.basename(file_path.last, '.rb').split('_').map(&:humanize).join('')
          file_path.pop
          file_path.shift
          file_path << file_name
          file = "#{file_suffix}/#{file_path.join('/')}"

          # skip if file name is application
          next if file_name.split('_').first == 'application'

          # skip if spec file exists
          next if File.exist?(file)

          if file_suffix == 'test'
            minitest_template(file, klass_name)
          else
            rspec_template(file, klass_name)
          end
        end
      end
    end
  end
end
