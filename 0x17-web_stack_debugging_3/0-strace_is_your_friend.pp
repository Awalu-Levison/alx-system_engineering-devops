# Fix internal HTTP/1.0 500 Internal Server Error
# Correct mistype .phpp files to .php fils
exec { 'fix config typo':
  command => "sed -i 's/.phpp/.php/' /var/www/html/wp-settings.php",
  path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
