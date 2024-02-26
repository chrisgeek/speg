# frozen_string_literal: true

# Return the list of file paths in a directory
module Speg
  module FilePaths
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
end
