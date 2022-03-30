package com.example.spingboot.controller;

import java.util.List;

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
@CrossOrigin(origins = {"http://localhost:3000", "http://nipunbahri.com"})
public class EmployeeController {
	

	@Autowired
	private EmployeeService employeeService;
	
	@GetMapping(path = "/employees")
	@ResponseStatus(code = HttpStatus.OK)
	public List<Employee> getEmployees(){
		return employeeService.findAllEmployees();
	}
	
	@PostMapping(path = "/employees")
	public Employee saveEmployee(@RequestBody Employee employee) {
		return employeeService.saveEmployee(employee);
	}
	
	@GetMapping(path = "/employees/{id}")
	@ResponseStatus(code = HttpStatus.FOUND)
	public Employee findEmployeeById(@PathVariable("id") Long employeeId) {
		return employeeService.findEmployeeById(employeeId);
	}

	@DeleteMapping(path = "/employees/{id}")
	public void deleteEmployeeById(@PathVariable("id") Long employeeId) {
		employeeService.deleteEmployeeById(employeeId);
	}
	
	@PutMapping(path = "/employees/{id}")
	public Employee updateEmployee(@RequestBody Employee employee, @PathVariable("id") Long employeeId) {
		return employeeService.updateEmployee(employee,employeeId);
	}
	
	//JPQL Query Creation
	//https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.query-methods.query-creation
	@GetMapping(path = "/employees/name/{lastName}")
	@ResponseStatus(code = HttpStatus.OK)
	public Employee getEmployeeByLastName(@PathVariable("lastName") String lastName){
		return employeeService.findEmployeeByLastName(lastName);
	}
	
	//Native Query
	//https://docs.spring.io/spring-data/jpa/docs/current/reference/html/#jpa.query-methods.query-creation
	@GetMapping(path = "/employees/search/{emailId}")
	@ResponseStatus(code = HttpStatus.OK)
	public List<Employee> getEmployeeOnGmail(@PathVariable("emailId") String emailId){
		return employeeService.findEmployeeOnGmail(emailId);
	}
}
