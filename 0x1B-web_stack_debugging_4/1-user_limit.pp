# Modify the OS configuration to add holberton as new user

exec {'OS security change file':
  command => 'sed -i "s/holberton/foo/" /etc/security/limits.config',
  path    => '/usr/bin/env/:/bin/:/usr/bin/:/usr/sbin/'
}
