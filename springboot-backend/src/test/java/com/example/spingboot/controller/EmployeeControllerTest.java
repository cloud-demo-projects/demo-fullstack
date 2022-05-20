package com.example.spingboot.controller;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import com.example.spingboot.model.Employee;
import com.example.spingboot.service.EmployeeService;

@WebMvcTest(EmployeeController.class)
class EmployeeControllerTest {

	@Autowired
	MockMvc mockMvc;

	@MockBean
	private EmployeeService employeeService;

	private Employee employee;

	@BeforeEach
	void setUp() throws Exception {
		employee = Employee.builder()
				.firstName("nipun")
				.lastName("bahri")
				.emailId("bahri.nipun@gmail.com")
				.id(1L)
				.build();
	}

//	@Test
//	void testSaveEmployee() {
//		Employee employeeInput = Employee.builder()
//				.firstName("nipun")
//				.lastName("bahri")
//				.emailId("bahri.nipun@gmail.com")
//				.build();
//
//		Mockito.when(employeeService.saveEmployee(employeeInput)).thenReturn(employee);
//		
//		try {
//			mockMvc.perform(MockMvcRequestBuilders.post("/api/v1/employees")
//					.contentType(MediaType.APPLICATION_JSON)
//					.content("{\r\n"
//							+ "    \"firstName\": \"nipun\",\r\n"
//							+ "    \"lastName\": \"bahri\",\r\n"
//							+ "    \"emailId\": \"bahri.nipun@gmail.com\"\r\n"
//							+ "}"))
//					.andExpect(MockMvcResultMatchers.status().isOk());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//
//	@Test
//	void testFindEmployeeById() {
//		Mockito.when(employeeService.findEmployeeById(1L)).thenReturn(employee);
//		
//		try {
//			mockMvc.perform(MockMvcRequestBuilders.get("/api/v1/employees/1")
//					.contentType(MediaType.APPLICATION_JSON))
//					.andExpect(MockMvcResultMatchers.status().isFound());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
//	
//	@Test
//	void testEmployeeByLastName() {
//		
//		try {
//			mockMvc.perform(MockMvcRequestBuilders.get("/api/v1/employees/name/bahri")
//					.contentType(MediaType.APPLICATION_JSON))
//					.andExpect(MockMvcResultMatchers.status().isOk());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//	}

}
