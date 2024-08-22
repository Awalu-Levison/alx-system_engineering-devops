# Increase the number of requests a web server can handle
# for good performance

# Increase the number of ULIMIT to accomodate more requests
exec {
  # Change the ULIMIT value
  command => '/bin/sed -i "s/15/4096/" /etc/default/nginx',
  # direct the command to the following path
  path    => '/usr/local/bin/:/bin/',
}

# Restart the web server
exec {'nginx-restart':
  # Restart the nginx server
  command => '/etc/init.d/nginx restart',
  # direct the path for the command
  path    => '/etc/init.d/',
}
