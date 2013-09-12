home_dir = node[:rvm][:home_dir]
username = node[:rvm][:username]

package "libxslt-dev"
package "libxml2-dev"

cookbook_file "/tmp/install_rvm.sh" do
  owner username
  group username
end

bash "install rvm" do
  code "cat /tmp/install_rvm.sh | bash -s stable && chown -R vagrant:admin /usr/local/rvm"
  not_if { File.exists?("/usr/local/rvm") }
end

cookbook_file "#{home_dir}/.zsh/rvm.zsh" do
  owner username
  group username
end

cookbook_file "#{home_dir}/.zsh/ruby.zsh" do
  owner username
  group username
end

cookbook_file "#{home_dir}/.zsh/gspec.zsh" do
  owner username
  group username
end

cookbook_file "#{home_dir}/.gemrc" do
  owner username
  group username
end

cookbook_file "#{home_dir}/.rspec" do
  owner username
  group username
end

bash "install chef gem" do
  "source '/usr/local/rvm' && gem install chef"
end
