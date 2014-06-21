require 'unit/spec_helper'

describe 'sprout-chruby::default_ruby' do
  let(:runner) { ChefSpec::Runner.new }

  it 'sets the default ruby' do
    runner.converge(described_recipe)

    expect(runner).to render_file('/home/fauxhai/.ruby-version').with_content('ruby-2.1.2')
  end

  it 'sets the specified default ruby' do
    runner.node.set['sprout']['chruby']['default_ruby'] = 'ruby-1.9.3-p547'

    runner.converge(described_recipe)

    expect(runner).to render_file('/home/fauxhai/.ruby-version').with_content('ruby-1.9.3-p547')
  end
end
