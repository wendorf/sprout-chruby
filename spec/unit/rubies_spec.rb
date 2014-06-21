require 'unit/spec_helper'

describe 'sprout-chruby::rubies' do
  let(:runner) { ChefSpec::Runner.new }

  it 'installs a default list of rubies' do
    runner.converge(described_recipe)

    expect(runner).to run_execute('ruby-install ruby 1.9.3-p547')
    expect(runner).to run_execute('ruby-install ruby 2.0.0-p451')
    expect(runner).to run_execute('ruby-install ruby 2.1.2')
  end

  it 'installs a specified list of rubies' do
    runner.node.set['sprout']['chruby']['rubies']['ruby'] = %w(1.9.3)
    runner.node.set['sprout']['chruby']['rubies']['jruby'] = %w(1.9.3)

    runner.converge(described_recipe)

    expect(runner).to run_execute('ruby-install ruby 1.9.3')
    expect(runner).to run_execute('ruby-install jruby 1.9.3')
  end

  it 'does not install rubies that have already been installed' do
    allow(::Dir).to receive(:exist?).and_return(true)

    runner.converge(described_recipe)

    expect(::Dir).to have_received(:exist?).with(::File.join(runner.node['sprout']['home'], '.rubies/ruby-2.1.2'))
    expect(runner).not_to run_execute('ruby-install ruby 2.1.2')
  end
end
