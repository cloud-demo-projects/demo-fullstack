package com.example.spingboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.spingboot.exception.ResourceNotFoundException;
import com.example.spingboot.model.Employee;
import com.example.spingboot.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeRepository employeeRepository;
	
	@Override
	public List<Employee> findAllEmployees(){
		return employeeRepository.findAll();
	}
	
	public Employee findEmployeeByLastName(String lastName){
		return employeeRepository.findByLastName(lastName);
	}

	@Override
	public Employee saveEmployee(Employee employee) {
		return employeeRepository.save(employee);
	}

	@Override
	public Employee findEmployeeById(Long employeeId) {
		Employee employee = null;
		if(!employeeRepository.findById(employeeId).isEmpty()) {
			employee = employeeRepository.findById(employeeId).get();
		}else {
			throw new ResourceNotFoundException("employee not found.");
		}
		return employee;
	}

	@Override
	public void deleteEmployeeById(Long employeeId) {
		employeeRepository.deleteById(employeeId);
	}

	@Override
	public Employee updateEmployee(Employee employee, Long employeeId) {
		Employee emp = employeeRepository.findById(employeeId).get();
		
		if( null != employee.getFirstName() && !employee.getFirstName().isEmpty()) {
			emp.setFirstName(employee.getFirstName());
		}
		
		if( null != employee.getLastName() && !employee.getLastName().isEmpty()) {
			emp.setLastName(employee.getLastName());
		}
		
		if( null != employee.getEmailId() && !employee.getEmailId().isEmpty()) {
			emp.setEmailId(employee.getEmailId());
		}
		
		return employeeRepository.save(emp);
	}

	@Override
	public List<Employee> findEmployeeOnGmail(String emailId) {
		return employeeRepository.findEmployeeOnGmail(emailId);
	}

	
}
