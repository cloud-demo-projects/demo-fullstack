package com.example.spingboot.service;

import java.util.List;

import com.example.spingboot.model.Skill;


public interface SkillService {
	
	public List<Skill> findAllSkills();
	
	public Skill saveSkill(Skill skill);

	public Skill findSkillById(Long skillId);
	
	public void deleteSkillById(Long skillId);

	public Skill updateSkill(Skill skill, Long skillId);

}
