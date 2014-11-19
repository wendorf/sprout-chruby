node.default['sprout']['chruby']['auto_change_ruby'] = true
node.default['sprout']['chruby']['default_ruby'] = 'ruby-2.1.2'

include_attribute 'sprout-base::home'
node.default['sprout']['chruby']['install_dir'] = File.join(node['sprout']['home'], '.rubies')
node.default['sprout']['chruby']['rubies'] = {
  'ruby' => [
    '1.9.3-p547',
    '2.0.0-p451',
    '2.1.2',
  ]
}
