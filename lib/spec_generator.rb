# frozen_string_literal: true

require 'speg/file_generator'

class SpecGenerator
  def self.generate_files
    Speg::FileGenerator.new.create_files
  end
end
