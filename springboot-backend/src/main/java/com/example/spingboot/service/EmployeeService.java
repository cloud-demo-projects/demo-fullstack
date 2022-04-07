package com.example.spingboot.service;

import java.util.List;
import com.example.spingboot.model.Employee;


public interface EmployeeService {
	
	public List<Employee> findAllEmployees();
	
	public Employee findEmployeeByLastName(String lastName);

	public Employee saveEmployee(Employee employee);

	public Employee findEmployeeById(Long employeeId);
	
	public void deleteEmployeeById(Long employeeId);

	public Employee updateEmployee(Employee employee, Long employeeId);

	public List<Employee> findEmployeeOnGmail(String emailId);

	public void updateEmployeeName(String firstName, String lastName, Long employeeId);

}
