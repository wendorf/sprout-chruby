require 'unit/spec_helper'

describe 'sprout-chruby::chruby' do
  let(:runner) { ChefSpec::SoloRunner.new }

  before { runner.converge(described_recipe) }

  it 'installs the chruby package' do
    expect(runner).to install_package('chruby')
  end

  it 'installs the bash-it plugin chruby-auto' do
    runner.converge(described_recipe)

    expect(runner).to enable_bash_it_feature('plugins/chruby-auto')
  end
end
