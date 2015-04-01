package 'ruby-install'

ruby_install_dir = node['sprout']['chruby']['rubies_dir']
node['sprout']['chruby']['rubies'].each do |ruby_vm, ruby_versions|
  ruby_versions.each do |ruby_version|
    execute "ruby-install --cleanup --rubies-dir #{ruby_install_dir} #{ruby_vm} #{ruby_version}" do
      user node['sprout']['user']
      not_if { Dir.exist?(File.join(ruby_install_dir, [ruby_vm, ruby_version].join('-'))) }
    end
  end
end
