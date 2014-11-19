require 'unit/spec_helper'

describe 'sprout-chruby::default_ruby' do
  let(:runner) { ChefSpec::SoloRunner.new }

  let(:ruby_version_file) { File.join(runner.node['sprout']['home'], '.ruby-version') }
  let(:chruby_default_script) { File.join(runner.node['bash_it']['dir'], 'custom', 'chruby-default_ruby.bash') }

  context 'when sprout.chruby.default_ruby is specified' do
    let(:default_ruby) { 'FAKE_RUBY-3.2.1' }

    before do
      runner.node.set['sprout']['chruby']['default_ruby'] = default_ruby
      runner.node.set['sprout']['chruby']['auto_change_ruby'] = auto_change_ruby
      runner.converge(described_recipe)
    end

    context 'when sprout.chruby.auto_change_ruby is true' do
      let(:auto_change_ruby) { true }

      it 'creates a .ruby-version file in sprout.home to set the default ruby' do
        expect(runner).to render_file(ruby_version_file).with_content(default_ruby)
      end

      it 'does not create a bash-it custom chruby-default_ruby script' do
        expect(runner).not_to render_file(chruby_default_script)
      end
    end

    context 'when sprout.chruby.auto_change_ruby is not true' do
      let(:auto_change_ruby) { false }

      it 'does not create a .ruby-version file in sprout.home'do
        expect(runner).not_to render_file(ruby_version_file)
      end

      it 'creates a custom bash-it plugin to set the default ruby' do
        expect(runner).to render_file(chruby_default_script).with_content("chruby #{default_ruby}")
      end
    end
  end

  context 'when sprout.chruby.default_ruby is specified' do
    before do
      runner.node.set['sprout']['chruby']['default_ruby'] = false # nil will not override default attribute
      runner.converge(described_recipe)
    end

    it 'does not create a .ruby-version file in sprout.home'do
      expect(runner).not_to render_file(ruby_version_file)
    end

    it 'does not create a bash-it custom chruby-default_ruby script' do
      expect(runner).not_to render_file(chruby_default_script)
    end
  end
end
