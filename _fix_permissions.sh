chown 1000:1000 -R ./data/www
find ./data/www -type d -exec chmod 755 {} \;
find ./data/www -type f -exec chmod 644 {} \;
chmod -R 777 ./data/www/var
chmod -R 777 ./data/www/config

