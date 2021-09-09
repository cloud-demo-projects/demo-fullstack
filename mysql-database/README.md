# MySQL Database Setup
- docker pull mysql
- docker run --name mysql-container -p3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
- docker exec -it mysql-container /bin/sh
- mysql -uroot -p
- create database employee_management_system;
- show databases;