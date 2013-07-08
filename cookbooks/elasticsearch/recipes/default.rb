# for production you probably want https://github.com/elasticsearch/cookbook-elasticsearch

home_dir = node[:elasticsearch][:home_dir]
username = node[:elasticsearch][:username]

es_package = "elasticsearch-0.90.1"
es_url = "https://download.elasticsearch.org/elasticsearch/elasticsearch/#{es_package}.tar.gz"
es_archive = "#{home_dir}/#{es_package}.tar.gz"
es_home = "#{home_dir}/.elasticsearch"
es_unpacked_path = "#{home_dir}/#{es_package}"

# TODO: encapsulate this download/unpack/move dance
remote_file es_archive do
  source es_url
  mode "0644"
  user username
  group username
end

directory es_home do
  action :delete
  recursive true
end

bash "unpack elasticsearch" do
  user username
  group username
  code "tar xvzf #{es_archive} -C #{home_dir}"
end

bash 'move elasticsearch' do
  user username
  group username
  code "mv #{es_unpacked_path} #{es_home}"
end

link "/usr/local/bin/elasticsearch" do
  to "#{es_home}/bin/elasticsearch"
  owner user
  group user
end

file es_archive do
  action :delete
end


