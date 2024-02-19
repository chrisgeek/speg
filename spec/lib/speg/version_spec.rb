# frozen_string_literal: true

require 'spec_helper'
require_relative '../../../lib/speg/version'

RSpec.describe Speg::Version do
  it 'has a version number' do
    expect(Speg::Version::VERSION).to eq '1.0.1'
  end
end
