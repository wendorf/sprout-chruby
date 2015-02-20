require 'unit/spec_helper'

describe 'sprout-chruby::chruby' do
  let(:runner) { ChefSpec::SoloRunner.new }
  let(:auto_change_ruby) { nil }

  before do
    runner.node.set['sprout']['chruby']['auto_change_ruby'] = auto_change_ruby

    runner.converge(described_recipe)
  end

  it 'installs the chruby package' do
    expect(runner).to install_package('chruby')
  end

  it 'runs the default_ruby recipe' do
    expect(runner).to include_recipe 'sprout-chruby::default_ruby'
  end

  context 'when sprout.chruby.auto_change_ruby is true' do
    let(:auto_change_ruby) { true }

    it 'installs the bash-it plugin chruby-auto' do
      expect(runner).to enable_bash_it_feature('plugins/chruby-auto')
    end

    it 'does not install the bash-it plugin chruby' do
      expect(runner).not_to enable_bash_it_feature('plugins/chruby')
    end
  end

  context 'when sprout.chruby.auto_change_ruby is not true' do
    let(:auto_change_ruby) { false }

    it 'installs the bash-it plugin chruby' do
      expect(runner).to enable_bash_it_feature('plugins/chruby')
    end

    it 'does not install the bash-it plugin chruby-auto' do
      expect(runner).not_to enable_bash_it_feature('plugins/chruby-auto')
    end
  end
end
