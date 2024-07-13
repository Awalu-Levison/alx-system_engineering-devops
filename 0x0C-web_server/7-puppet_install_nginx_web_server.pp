# Set up new ubuntu server without using the bash
# with nginx with puppet configuration management tool

exec { 'update system':
	command => '/usr/bin/apt-get update',
}
package { 'nginx server':
	ensure => 'installed',
	require => Exec['update system']
}

file {'/var/www/html/index.html':
	ensure => 'present',
	path => '/etc/nginx/sites-available/default',
	content => 'Hello World!'
}

exec {'redirect_me':
	command => 'sed -i "24i\ rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;" /etc/nginx/sites-available/default',
	provider => 'shell'
}

service {'nginx':
	ensure => running,
	require => Package['nginx']
}
