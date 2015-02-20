if node['sprout']['chruby']['default_ruby']
  puts "node['sprout']['chruby']['default_ruby'] #{node['sprout']['chruby']['default_ruby']}"
  if node['sprout']['chruby']['auto_change_ruby']
    file File.join(node['sprout']['home'], '.ruby-version') do
      content node['sprout']['chruby']['default_ruby']
      user node['sprout']['user']
      action :create_if_missing
    end
  else
    file File.join(node['bash_it']['dir'], 'custom', 'chruby-default_ruby.bash') do
      content "chruby #{node['sprout']['chruby']['default_ruby']}"
      user node['sprout']['user']
      action :create_if_missing
    end
  end
end
