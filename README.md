
# STS Project Creation
Modules- Spring web, devtools, JPA

# Running Mysql container
docker pull mysql
docker run --name mysql-container -p3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:latest
docker exec -it mysql-container /bin/sh
mysql -uroot -p
create database employee_management_system;
show databases;

Create Model

Create Repository interface extending JpaRepository

Create Controller injecting repository autowiring with first method and test

DB
create database employee_management_system;
Repository creates the table itself
select * from employee_management_system.employees;
insert into employee_management_system.employees values(1,"bahri.nipun@gmail.com","Nipun","Bahri");


# React app
- Creating React App- (Steps: npx create-react-app my-app, cd my-app, npm start ), Edit and see app.js

Import bootstrap css library- npm install bootstrap --save

Import bootstrap css- import 'bootstrap/dist/css/bootstrap.min.css';

For faster development use- Reactjs code snippets VS code extention e.g. write rcc intellisense in component jsx file

Create and include component (Import axios http library for making http calls i.e. npm install axios --save)

Create Service file

Create Header & Footer compomentnts with static content & include in UI

Routing- npm install react-router-dom
import {BrowserRouter as Router, Route, Switch} from 'react-router-dom';
