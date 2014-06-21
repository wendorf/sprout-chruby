require 'spec_helper'

describe 'sprout-chruby' do
  before :all do
    expect(system('which chruby')).to eq(false)
    expect(system('soloist')).to eq(true)
  end

  it 'installs chruby' do
    expect(system('which chruby')).to eq(true)
  end
end
