include_attribute 'sprout-base::home'

node.default['sprout']['chruby']['path'] = File.join(
  node.default['sprout']['home'], 'chruby'
)
