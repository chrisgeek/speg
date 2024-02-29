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

      @option_parser.on('-sg', '--spec_generate ARGUEMENT', 'generate single spec file') do |file_path|
        generate_single_test_file('spec', file_path)
      end

      @option_parser.on('-tg', '--test_generate ARGUEMENT', 'generate single test file') do |file_path|
        generate_single_test_file('test', file_path)
      end

      if ARGV.empty?
        puts @option_parser.help
        exit
      end

      @option_parser.parse!
    end

    def generate_single_test_file(test_suit, dir)
      _file_name, file_path, klass_name = file_data(dir, test_suit)

      generate_file(test_suit, file_path, klass_name)
    end

    def generate_test_files(test_suit)
      PATHS.each do |path|
        next unless Dir.exist?(path)

        file_paths(path).each do |dir|
          file_name, file_path, klass_name = file_data(dir, test_suit)

          # skip if file name is application
          next if file_name.split('_').first == 'application'

          # skip if spec file exists
          next if File.exist?(file_path)

          generate_file(test_suit, file_path, klass_name)
        end
      end
    end

    private

    # return file_name, file_path and klass_name
    def file_data(dir, test_suit)
      file_path = dir.split('/')
      file_name = "#{file_path.last.split('.').first}_#{test_suit}.rb"
      klass_name = File.basename(file_path.last, '.rb').split('_').map(&:humanize).join('')
      file_path.pop
      file_path.shift
      file_path << file_name
      file = "#{test_suit}/#{file_path.join('/')}"

      [file_name, file, klass_name]
    end

    def generate_file(test_suit, file, klass_name)
      if test_suit == 'test'
        minitest_template(file, klass_name)
      else
        rspec_template(file, klass_name)
      end
    end
  end
end
