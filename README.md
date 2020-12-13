Escrito por Pedro Reina Rojas (apachebcn@gmail.com)
# Lampp

## Comandos utiles:

- Ejecutar contenedor : `docker-compose up -d`
- Parar contenedor : `docker-compose down`
- Reconstruir contendor : `docker-compose up -d --build`

## Xdebug
Para habilitar/deshabilitar xdebug, editar el fichero `Dockerfile`, y setear `xdebug.remote_enable` a `on` o `off`
Para setear variables de xdebug, editar el fichero `Dockerfile` en los respectivos `RUN echo` donde escribe en `> /usr/local/etc/php/php.ini`

## Scripts de ayuda
### Entrar en los contenedores
`scripts/bash_php.sh`
`scripts/bash_mysql.sh`
### Corregir permisos de volumen de php
`scripts/fix_permissions.sh`

## Versiones
- Apache 2.4
- Mariadb 10.5.8 
- NodeJs 10 
- Php 7.3 
- Xdebug
- Opcache
- memcached
