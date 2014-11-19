require 'unit/spec_helper'

describe 'sprout-chruby::default' do
  let(:runner) { ChefSpec::Runner.new }

  before do
    runner.converge(described_recipe)
  end

  it 'always installs chruby with Homebrew' do
    expect(runner).to install_package('chruby')
  end

  it 'installs rubies by default' do
    expect(runner).to include_recipe 'sprout-chruby::rubies'
    expect(runner).to include_recipe 'sprout-chruby::default_ruby'
  end

  it 'installs chruby by default' do
    expect(runner).to include_recipe 'sprout-chruby::chruby'
  end
end
