package com.example.spingboot.repository;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.orm.jpa.TestEntityManager;

import com.example.spingboot.model.Employee;

@DataJpaTest
class EmployeeRepositoryTest {
	
//	@Autowired
//	EmployeeRepository employeeRepository;
//
//	@Autowired
//	TestEntityManager testEntityManager;
//	
//	@BeforeEach
//	void setUp() throws Exception {
//		Employee employee = Employee.builder()
//							.firstName("amit")
//							.lastName("sharma")
//							.emailId("amit.sharma@gmail.com")
//							.build();
//		
//		testEntityManager.persist(employee);
//	}
//
//	@Test
//	@Disabled("Disabled temporariliy")
//	void whenFindByIdThenReturnEmployee() {
//		
//		Employee employee = employeeRepository.findById(1L).get();
//		assertEquals(employee.getFirstName(), "amit");
//	}

}
