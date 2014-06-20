require 'spec_helper'

describe 'sprout-chruby' do
  before :all do
    expect(File).not_to be_exists("#{ENV['HOME']}/chruby")
    expect(system('soloist')).to eq(true)
  end

  it 'creates a file in the home directory' do
    expect(File).to be_exists("#{ENV['HOME']}/chruby")
  end

  it 'is owned by the current user not root' do
    expect(File.stat("#{ENV['HOME']}/chruby")).to be_owned
  end
end
