#!/usr/bin/env bash
# Configuring the server to use ssh connection using puppet configuration tool
file {'/etc/ssh/ssh_config':
  ensure  =>  'present',
}

file_line {'Turn off password auth':
  path    =>  'PasswordAuthentication no',
  line    =>  'PasswordAuthentication no',
  match   =>  'PasswordAuthentication yes',
  replace =>  'true',
}

file_line {'Using a private key':
  path    =>  '/etc/ssh/ssh_config',
  line    =>  'IdentityFile ~/.ssh/school',
  match   =>  '^IdentityFile',
  ensure  =>  'present',
}
