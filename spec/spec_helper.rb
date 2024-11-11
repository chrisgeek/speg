# frozen_string_literal: true
require 'fileutils'
RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.after(:suite) do
    # delete dummy test_spec.rb file after test completes
    spec_file = File.expand_path('spec/lib/models/dummy_model_spec.rb')
    file = File.expand_path('spec/lib/models/test_spec.rb')

    File.delete(file) if File.exist?(file)
    File.delete(spec_file) if File.exist?(spec_file)
    FileUtils.rm_rf('test') if Dir.exist?('test')
  end
end
