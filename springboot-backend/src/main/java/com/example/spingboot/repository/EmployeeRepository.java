package com.example.spingboot.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.example.spingboot.model.Employee;

@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long>{
	
	public Employee findByLastName(@Param("lastName") String lastName);
	
	@Query(nativeQuery = true, value = "select * from employee e where e.email_Id = ?1")
	public List<Employee> findEmployeeOnGmail(@Param("emailId") String emailId);
	
	@Transactional
	@Modifying
	@Query(nativeQuery = true, value = "update employee e set e.firstName = :firstName, e.lastName = :lastName where e.employeeId = :employeeId")
	public Employee updateEmployeeName(@Param("firstName") String firstName, @Param("lastName") String lastName, @Param("employeeId") Long employeeId);

}
									