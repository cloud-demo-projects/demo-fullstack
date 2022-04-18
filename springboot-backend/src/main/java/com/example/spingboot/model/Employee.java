package com.example.spingboot.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Employee {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;	
	
	@NotBlank(message = "firstName can not be blank")
	private String firstName;
	
	@NotBlank(message = "lastName can not be blank")
	private String lastName;
	
	@Email(message = "Please provide valid email Id")
	private String emailId;
	
}
