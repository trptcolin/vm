package "git-core"

username = "vagrant"
home_dir = "/home/#{username}"

template "#{home_dir}/.gitconfig" do
  owner username
  group username
  variables :full_name => node["git"]["full_name"],
            :email => node["git"]["email"]
end

cookbook_file "#{home_dir}/.gitignore_global" do
  owner username
  group username
end
