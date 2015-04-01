require 'unit/spec_helper'

describe 'sprout-chruby::rubies' do
  let(:runner) { ChefSpec::SoloRunner.new }

  let(:ruby_install_cmd) { "ruby-install --rubies-dir #{runner.node['sprout']['chruby']['rubies_dir']}" }

  it 'installs a default list of rubies' do
    runner.converge(described_recipe)

    expect(runner).to run_execute("#{ruby_install_cmd} ruby 1.9.3-p547")
    expect(runner).to run_execute("#{ruby_install_cmd} ruby 2.0.0-p451")
    expect(runner).to run_execute("#{ruby_install_cmd} ruby 2.1.2")
  end

  it 'installs a specified list of rubies' do
    runner.node.set['sprout']['chruby']['rubies'] = {
      'ruby' => %w(1.9.3),
      'jruby' => %w(1.9.3)
    }

    runner.converge(described_recipe)

    expect(runner).to run_execute("#{ruby_install_cmd} ruby 1.9.3")
    expect(runner).to run_execute("#{ruby_install_cmd} jruby 1.9.3")
  end

  it 'does not install rubies that have already been installed' do
    runner.node.set['sprout']['chruby']['rubies'] = { 'ruby' => %w(2.1.2) }

    allow(Dir).to receive(:exist?).and_return(true)

    runner.converge(described_recipe)

    expect(Dir).to have_received(:exist?).with(File.join(runner.node['sprout']['chruby']['rubies_dir'], 'ruby-2.1.2'))

    expect(runner).not_to run_execute("#{ruby_install_cmd} ruby 2.1.2")
  end
end
