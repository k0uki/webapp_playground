Chef::Log.info('start deploy!!')

pid_path = '/var/run/webapp/puma.pid'
sock_path = '/var/run/webapp/puma.sock'

bash "bundle install" do
  cwd '/srv/webapp'
  user 'webapp'
  code <<-EOH
  bundle install
  EOH
end

bash "start puma" do
  cwd '/srv/webapp'
  user 'webapp'
  code <<-EOH
pid_path=/var/run/webapp/puma.pid
sock_path=/var/run/webapp/puma.sock

kill -0 `cat $pid_path` > /dev/null 2>&1

if [ $? = 0 ]; then
    kill -s USR2 `cat ${pid_path}`
else
    bundle exec puma -b "unix://${sock_path}" --pidfile "${pid_path}"  -d
fi
  EOH

end
