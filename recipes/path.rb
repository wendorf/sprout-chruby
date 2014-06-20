file node['sprout']['chruby']['path'] do
  action :touch
  owner node['current_user']
end
