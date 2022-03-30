package com.example.spingboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.spingboot.model.Employee;
import com.example.spingboot.repository.EmployeeRepository;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeRepository employeeRepository;
	
	public List<Employee> findAllEmployees(){
		return employeeRepository.findAll();
	}
	
	public Employee findEmployeeByLastName(String lastName){
		return employeeRepository.findByLastName(lastName);
	}

}
