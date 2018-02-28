default['nginx']['default_site_enabled']   = false
default['nginx']['log_formats']  = {ltsv: <<EOS
                "time:$time_local"
                "\\thost:$remote_addr"
                "\\tforwardedfor:$http_x_forwarded_for"
                "\\treq:$request"
                "\\tstatus:$status"
                "\\ttsize:$body_bytes_sent"
                "\\treferer:$http_referer"
                "\\tua:$http_user_agent"
                "\\treqtime:$request_time"
                "\\tcache:$upstream_http_x_cache"
                "\\truntime:$upstream_http_x_runtime"
                "\\tvhost:$host"
EOS
}
default['nginx']['access_log_options'] = "ltsv"
default['nginx']['log_dir_perm'] = "0755"
