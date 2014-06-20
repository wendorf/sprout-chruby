require 'unit/spec_helper'

describe 'sprout-chruby::default' do
  let(:runner) { ChefSpec::Runner.new }

  it 'includes the path recipe' do
    runner.converge(described_recipe)
    expect(runner).to include_recipe('sprout-chruby::path')
  end
end
