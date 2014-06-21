file ::File.join(node['sprout']['home'], '.ruby-version') do
  content node['sprout']['chruby']['default_ruby']
  user node['current_user']
  action :create_if_missing
end
