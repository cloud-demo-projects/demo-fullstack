package com.example.spingboot.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotEquals;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;

import com.example.spingboot.model.Employee;
import com.example.spingboot.repository.EmployeeRepository;

@SpringBootTest
class EmployeeServiceTest {

	@Autowired
	private EmployeeService employeeService;
	
	@MockBean
	private EmployeeRepository employeeRepository;
	
	@BeforeEach
	void setUp() throws Exception {
		Employee employee = Employee.builder()
				.firstName("nipun")
				.lastName("bahri")
				.emailId("bahri.nipun@gmail.com")
				.build();
		
		Mockito.when(employeeRepository.findByLastName("bahri")).thenReturn(employee);		
	}

//	@Test
//	@DisplayName("Service Layer Testcase: Get Data based on valid employee last name")
//	void whenValidEmployeeThenEmployeeShouldFound() {		
//		String employeeLastName = "bahri";		
//		Employee found = employeeService.findEmployeeByLastName(employeeLastName);		
//		assertEquals(employeeLastName, found.getLastName());
//	}
//	
//	@Test
//	@Disabled("Service Layer Testcase Disabled: This test case is disabled temporarily due to absence of mocked employee object.")
//	void whenInvalidEmployeeThenEmployeeShouldNotFound() {		
//		String employeeLastName = "blabla";		
//		Employee found = employeeService.findEmployeeByLastName(employeeLastName);		
//		assertNotEquals(employeeLastName, found.getLastName());
//	}

}
