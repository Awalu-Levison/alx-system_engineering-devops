# Fix internal HTTP/1.0 500 Internal Server Error
# Correct mistype .phpp files to .php fils
exec {'fix code typos':
    command => "sed -i 's/phpp/php/g' /var/www/html/wp-settings.php",
    path    => 'usr/bin/:bin'
}
