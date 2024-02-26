require 'spec_helper'
require_relative '../../../lib/speg/file_generator'

RSpec.describe Speg::FileGenerator do
  let(:path){ ['spec/lib/models'] }
  let(:file_path) { 'spec/lib/models/dummy_model_spec.rb' }

  context 'generate file' do
    before(:each) do
      stub_const('Speg::FileGenerator::PATHS', path)
      described_class.new.generate_test_files('spec') 
    end

    it 'generates a spec file' do
      expect(File.exist?('spec/lib/models/test_spec.rb')).to be_truthy
    end

    xit 'skips existing files' do
      expect(described_class.new.generate_test_files('spec')).not_to eq file_path
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
end
