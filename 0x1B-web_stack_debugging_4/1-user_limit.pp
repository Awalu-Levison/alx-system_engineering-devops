# Add holberton as a new user
# by modifying the configuration files

exec {'Modify security system config file':
  command => 'sed -i "s/holberton/foo/" /etc/security/limits.config',
  path    => '/usr/bin/env/:/bin/:/usr/bin/:/usr/sbin'
}
