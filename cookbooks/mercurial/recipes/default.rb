package "mercurial"

home_dir = node[:mercurial][:home_dir]
template "#{home_dir}/.hgrc" do
  variables :full_name => node[:mercurial][:full_name],
            :email => node[:mercurial][:email],
            :host_fingerprints => node[:mercurial][:host_fingerprints]
end
