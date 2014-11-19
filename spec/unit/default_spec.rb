require 'unit/spec_helper'

describe 'sprout-chruby::default' do
  let(:runner) { ChefSpec::Runner.new }

  before { runner.converge(described_recipe) }

  it 'installs rubies by default' do
    expect(runner).to include_recipe 'sprout-chruby::rubies'
    expect(runner).to include_recipe 'sprout-chruby::default_ruby'
  end

  it 'installs chruby by default' do
    expect(runner).to include_recipe 'sprout-chruby::chruby'
  end
end
