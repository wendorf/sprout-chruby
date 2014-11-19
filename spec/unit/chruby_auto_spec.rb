require 'unit/spec_helper'

describe 'sprout-chruby::chruby_auto' do
  let(:runner) { ChefSpec::Runner.new }

  it 'installs the bash-it plugin chruby-auto' do
    runner.converge(described_recipe)

    expect(runner).to enable_bash_it_feature('plugins/chruby-auto')
  end
end
