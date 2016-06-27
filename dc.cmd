docker-compose up -d nginx mariadb

:: https://github.com/docker/compose/issues/1809
docker exec pd_mariadb_1 /bin/bash /entrypoint-initdb.d/init_db.sh

