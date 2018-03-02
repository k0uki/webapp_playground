link "/etc/localtime" do
  to "/usr/share/zoneinfo/Asia/Tokyo"
end

group 'webapp' do
  group_name 'webapp'
  gid        310
  action     [:create]
end

user 'webapp' do
  comment  'webapp'
  uid      310
  group    'webapp'
  home     '/var/run/webapp'
  shell    '/bin/false'
  password nil
  supports :manage_home => true
  action   [:create, :manage]
end

directory '/var/run/webapp/' do
  owner  "webapp"
  group  "webapp"
  mode   '0755'
  action :create
end

directory '/srv/webapp/' do
  owner  "webapp"
  group  "webapp"
  mode   '0755'
  action :create
end
