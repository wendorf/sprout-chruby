package 'chruby'

include_recipe 'sprout-base::bash_it'

sprout_base_bash_it_enable_feature 'plugins/chruby-auto'
