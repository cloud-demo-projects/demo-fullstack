[![Build Status](https://dev.azure.com/bahrinipun/demo-fullstack/_apis/build/status/springboot-backend?branchName=master)](https://dev.azure.com/bahrinipun/demo-fullstack/_build/latest?definitionId=48&branchName=master)

# Application Setup
- STS Project with modules- Spring web, Devtools, JPA
- Create Model
- Create Repository interface extending JpaRepository
- Create Controller injecting repository autowiring with first method and test
- DB
  create database employee_management_system;
  Repository creates the table itself
  select * from employee_management_system.employees;
  insert into employee_management_system.employees values(1,"bahri.nipun@gmail.com","Nipun","Bahri");
  
# Additionals
- Dockerfile Linting
docker run --rm -i hadolint/hadolint < Dockerfile

- Trivy Image Scan
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v C:\Users\nipun\.cache:/root/.cache/ aquasec/trivy:0.19.2 sb:latest

