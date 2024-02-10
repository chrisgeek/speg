# frozen_string_literal: true

require 'rails/generators'

 class SpecGenerator < Rails::Generators::Base
   PATHS = %w[app/models app/controllers].freeze

    def create_spec_files
      PATHS.each do |path|
        file_paths(path).each do |file_path|
          spec_path = file_path.split('/')
          file_name = "#{spec_path.last.split('.').first}_spec.rb"
          klass_name = File.basename(spec_path.last, '.rb').split('_').map(&:humanize).join('')
          spec_path.pop
          spec_path.shift
          spec_path << file_name

          # skip if file name is application
          next if file_name.split('_').first == 'application'

          # skip if spec file exists
          next if File.exist?("spec/#{spec_path.join('/')}")

          create_spec("spec/#{spec_path.join('/')}", klass_name)
        end
      end
    end

    private

    def create_spec(file_path, klass_name)
      create_file file_path, <<~RUBY
      require 'rails_helper'

      RSpec.describe #{klass_name} do
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