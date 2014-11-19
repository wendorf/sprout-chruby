require 'unit/spec_helper'

describe 'sprout-chruby::chruby' do
  let(:runner) { ChefSpec::SoloRunner.new }

  before { runner.converge(described_recipe) }

  it 'installs the chruby package' do
    expect(runner).to install_package('chruby')
  end

  context 'when sprout.chruby.auto_change_ruby is true' do
    before { runner.node.set['sprout']['chruby']['auto_change_ruby'] = true }

    it 'installs the bash-it plugin chruby-auto' do
      runner.converge(described_recipe)

      expect(runner).to enable_bash_it_feature('plugins/chruby-auto')
    end
  end

  context 'when sprout.chruby.auto_change_ruby is not true' do
    before { runner.node.set['sprout']['chruby']['auto_change_ruby'] = false }

    it 'installs the bash-it plugin chruby' do
      runner.converge(described_recipe)

      expect(runner).to enable_bash_it_feature('plugins/chruby')
    end

    it 'does not install the bash-it plugin chruby-auto' do
      runner.converge(described_recipe)

      expect(runner).not_to enable_bash_it_feature('plugins/chruby-auto')
    end
  end
end
