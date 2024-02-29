require 'spec_helper'
require_relative '../../../lib/speg/file_generator'

RSpec.describe Speg::FileGenerator do
  let(:path){ ['spec/lib/models'] }
  let(:file_path) { 'spec/lib/models/dummy_model_spec.rb' }

  describe 'generate file' do
    before do
      stub_const('Speg::FileGenerator::PATHS', path)
      described_class.new.generate_test_files('spec') 
    end

    it 'generates a spec file' do
      expect(File.exist?('spec/lib/models/test_spec.rb')).to be_truthy
    end
  end

  context '#rspec_template' do
    before { described_class.new.rspec_template(file_path, 'DummyModel') }

    it 'generates the spec file' do
      expect(File.exist?(file_path)).to be_truthy
    end

    it 'contains boilerplate code' do
      expect(File.read(file_path)).to include('RSpec.describe DummyModel')
    end
  end

  describe '#generate_single_test_file' do
    before do
      path = 'spec/lib/models/dummy.rb'
      described_class.new.generate_single_test_file('test', path)
    end

    it 'generates single test file' do
      expect(File.exist?('test/lib/models/dummy_test.rb')).to be_truthy
    end
  end
end
