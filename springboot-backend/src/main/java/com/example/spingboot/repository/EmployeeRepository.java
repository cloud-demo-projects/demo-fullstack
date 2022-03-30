package com.example.spingboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.example.spingboot.model.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long>{
	
	public Employee findByLastName(String lastName);
	
	@Query(value = "select * from employee e where e.email_Id = ?1",nativeQuery = true)
	public List<Employee> findEmployeeOnGmail(String emailId);

}
									