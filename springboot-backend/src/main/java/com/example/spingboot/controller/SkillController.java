package com.example.spingboot.controller;

import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import com.example.spingboot.model.Skill;
import com.example.spingboot.service.SkillService;

@RestController
@RequestMapping(path = "/api/v1/")
@CrossOrigin("*")
public class SkillController {
	
	private final Logger LOGGER = LoggerFactory.getLogger(SkillController.class);
	
	@Autowired
	private SkillService skillService;
	
	@GetMapping(path = "/skills")
	@ResponseStatus(code = HttpStatus.OK)
	public List<Skill> getSkills(){
		return skillService.findAllSkills();
	}
	
	@PostMapping(path = "/skills")
	public Skill saveSkill(@Valid @RequestBody Skill skill) {
		LOGGER.info("Creating skill record");
		return skillService.saveSkill(skill);
	}
	
	@GetMapping(path = "/skills/{id}")
	@ResponseStatus(code = HttpStatus.FOUND)
	public Skill findSkillById(@Valid @PathVariable("id") Long skillId) {
		LOGGER.info("Getting findSkillById");
		return skillService.findSkillById(skillId);
	}

	@DeleteMapping(path = "/skills/{id}")
	public void deleteSkillById(@PathVariable("id") Long skillId) {
		LOGGER.info("deleteSkillById");
		skillService.deleteSkillById(skillId);
	}
	
	@PutMapping(path = "/skills/{id}")
	public Skill updateSkill(@Valid @RequestBody Skill skill, @PathVariable("id") Long skillId) {
		LOGGER.info("updateSkill");
		return skillService.updateSkill(skill,skillId);
	}

}
