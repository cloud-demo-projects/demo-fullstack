package com.example.spingboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.example.spingboot.model.Skill;
import com.example.spingboot.service.SkillService;

@RestController
@RequestMapping(path = "/api/v1/")
@CrossOrigin(origins = {"http://localhost:3000", "http://nipunbahri.com"})
public class SkillController {
	
	@Autowired
	private SkillService skillService;
	
	@GetMapping(path = "/skills")
	@ResponseStatus(code = HttpStatus.OK)
	public List<Skill> getSkills(){
		return skillService.findAllSkills();
	}

}
