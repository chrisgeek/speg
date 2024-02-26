require 'rails/generators'

module Speg
  module Templates
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
  end
end
