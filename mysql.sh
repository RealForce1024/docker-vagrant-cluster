docker run --name=mysql --restart=always -di -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root docker.io/centos/mysql-57-centos7

--lower_case_table_names=1
--character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

docker run --name mysql3 -e MYSQL_ROOT_PASSWORD=root -d docker.io/centos/mysql-57-centos7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci

docker cp ~/my.cnf f01bcbdb5bfa:/etc/my.cnf.d/

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION
FLUSH RIVILEGES
