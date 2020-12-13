chown 1000:1000 -R ../volumes/www
find ../volumes/www -type d -exec chmod 755 {} \;
find ../volumes/www -type f -exec chmod 644 {} \;

source ../.env
docker exec -u root -ti ${CONTAINER_NAME}_mysql sh -c "chmod 644 /etc/mysql"
docker exec -u root -ti ${CONTAINER_NAME}_mysql sh -c "chmod 0444 -R /etc/mysql/*.cnf"

