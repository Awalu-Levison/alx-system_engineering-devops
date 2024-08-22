# Modify the OS configuration to add holberton as new user

exec {'Modify security system config file':
  command => 'sed -i "s/holberton/foo/" /etc/security/limits.config',
  path    => '/usr/bin/env/:/bin/:/usr/bin/:/usr/sbin/'
}
