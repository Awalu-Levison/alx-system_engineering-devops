#Execute a command on remote server with puppet tool

exec { 'pkill -f killmenow':
  path   => '/usr/bin:/usr/local/bin:/bin',
}
