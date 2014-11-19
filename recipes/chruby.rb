package 'chruby'

include_recipe 'sprout-base::bash_it'

if node['sprout']['chruby']['auto_change_ruby']
  sprout_base_bash_it_enable_feature 'plugins/chruby-auto'
else
  sprout_base_bash_it_enable_feature 'plugins/chruby'
end

include_recipe 'sprout-chruby::default_ruby'
