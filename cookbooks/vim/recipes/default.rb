package "vim-nox"
package "build-essential"

home_dir = "/home/vagrant"
vim_dir = "#{home_dir}/.vim"

git vim_dir do
  repository "https://github.com/trptcolin/vimfiles.git"
  reference "master"
  action :sync
end

bash "update bundle" do
  code <<-EOF
    cd #{vim_dir}
    ruby update_bundles
  EOF
end

bash "build command-t" do
  code <<-EOF
    cd #{vim_dir}/bundle/Command-T/ruby/command-t
    ruby extconf.rb
    make clean
    make
  EOF
end

link "#{home_dir}/.vimrc" do
  to "#{vim_dir}/.vimrc"
end
