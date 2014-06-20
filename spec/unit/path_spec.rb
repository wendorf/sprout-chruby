require 'unit/spec_helper'

describe 'sprout-chruby::path' do
  let(:runner) { ChefSpec::Runner.new }

  it 'creates a file in the home directory' do
    runner.converge(described_recipe)
    expect(runner).to touch_file('/home/fauxhai/chruby')
  end

  it 'respects the path attribute for the file' do
    runner.node.set['sprout']['chruby']['path'] = '/path/to/chruby'
    runner.converge(described_recipe)
    expect(runner).to touch_file('/path/to/chruby')
  end
end
