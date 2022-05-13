package com.example.spingboot.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.example.spingboot.model.Employee;
import com.example.spingboot.service.EmployeeService;

@RestController
@RequestMapping(path = "/api/v1/")
@CrossOrigin("*")
public class EmployeeController {
	
	private final Logger LOGGER = LoggerFactory.getLogger(EmployeeController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@GetMapping(path = "/employees")
	@ResponseStatus(code = HttpStatus.OK)
	public List<Employee> getEmployees(){
		LOGGER.info("Getting employee records");
		return employeeService.findAllEmployees();
	}
	
	@PostMapping(path = "/employees")
	public Employee saveEmployee(@Valid @RequestBody Employee employee) {
		LOGGER.info("Creating employee record");
		return employeeService.saveEmployee(employee);
	}
	
	@GetMapping(path = "/employees/{id}")
	@ResponseStatus(code = HttpStatus.FOUND)
	public Employee findEmployeeById(@Valid @PathVariable("id") Long employeeId) {
		LOGGER.info("Getting findEmployeeById");
		return employeeService.findEmployeeById(employeeId);
	}

	@DeleteMapping(path = "/employees/{id}")
	public void deleteEmployeeById(@PathVariable("id") Long employeeId) {
		LOGGER.info("deleteEmployeeById");
		employeeService.deleteEmployeeById(employeeId);
	}
	
	@PutMapping(path = "/employees/{id}")
	public Employee updateEmployee(@Valid @RequestBody Employee employee, @PathVariable("id") Long employeeId) {
		LOGGER.info("updateEmployee");
		return employeeService.updateEmployee(employee,employeeId);
	}
	
	//JPQL Query Creation
	//https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.query-methods.query-creation
	@GetMapping(path = "/employees/name/{lastName}")
	@ResponseStatus(code = HttpStatus.OK)
	public Employee getEmployeeByLastName(@PathVariable("lastName") String lastName){
		LOGGER.info("getEmployeeByLastName");
		return employeeService.findEmployeeByLastName(lastName);
	}
	
	//Native Query
	//https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.query-methods.query-creation
	@GetMapping(path = "/employees/search/{emailId}")
	@ResponseStatus(code = HttpStatus.OK)
	public List<Employee> getEmployeeOnGmail(@PathVariable("emailId") String emailId){
		LOGGER.info("getEmployeeOnGmail");
		return employeeService.findEmployeeOnGmail(emailId);
	}
}
