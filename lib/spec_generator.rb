# frozen_string_literal: true

require 'rails/generators'
require 'optparse'
require 'debug'

 class SpecGenerator < Rails::Generators::Base
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

         # skip if file name is application
         next if file_name.split('_').first == 'application'

         # skip if spec file exists
         next if File.exist?("file_suffix/#{file_path.join('/')}")

         if file_suffix == 'test'
           minitest_template("#{file_suffix}/#{file_path.join('/')}", klass_name)
         else
           rspec_template("#{file_suffix}/#{file_path.join('/')}", klass_name)
         end
       end
     end
   end

    # private

    def rspec_template(file_path, klass_name)
      create_file file_path, <<~RUBY
        require 'rails_helper'

        RSpec.describe #{klass_name} do
        end
      RUBY
    end

    def minitest_template(file_path, klass_name)
      create_file file_path, <<~RUBY
        require 'minitest/autorun'

        class #{klass_name} < Minitest::Test
        end
      RUBY
    end

    def file_paths(directory)
      entries = Dir.entries(directory).reject { |f| f.start_with?('.') }

      files = []

      entries.each do |entry|
        full_path = File.join(directory, entry)
        if File.directory?(full_path)
          files.concat(file_paths(full_path))
        else
          files << full_path
        end
      end

      files
    end
  end
