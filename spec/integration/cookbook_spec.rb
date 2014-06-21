require 'spec_helper'

describe 'sprout-chruby' do
  before :all do
    expect(system('brew list chruby')).to eq(false)
    expect(system('soloist')).to eq(true)
  end

  it 'installs chruby' do
    expect(system('brew list chruby')).to eq(true)
  end

  it 'installs a few rubies' do
    expect(Dir.exist?(File.join(ENV['HOME'], '/.rubies'))).to eq(true)
  end

  it 'sets a default ruby' do
    expect(File.exist?(File.join(ENV['HOME'], '/.ruby-version'))).to eq(true)
  end
end
