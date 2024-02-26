require 'spec_helper'
require_relative '../../../lib/speg/file_generator'

RSpec.describe Speg::FileGenerator do
  let(:path){ ['spec/lib/models'] }
  let(:file_path) { 'spec/lib/models/dummy_model_spec.rb' }

  it 'generates files' do
    stub_const('Speg::FileGenerator::PATHS', path)
    described_class.new.generate_test_files('spec')

    expect(File.exist?('spec/lib/models/test_spec.rb')).to be_truthy
  end

  it 'generates rspec file' do
    described_class.new.rspec_template(file_path, 'DummyModel')

    expect(File.exist?(file_path)).to be_truthy
  end
end
