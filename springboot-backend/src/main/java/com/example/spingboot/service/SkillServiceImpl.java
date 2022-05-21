package com.example.spingboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.example.spingboot.exception.ResourceNotFoundException;
import com.example.spingboot.model.Skill;
import com.example.spingboot.repository.SkillRepository;

@Service
public class SkillServiceImpl implements SkillService {
	
	@Value("${exception.skillMessage}")
	private String skillMessage;
	
	@Autowired
	private SkillRepository skillRepository;
	
	public List<Skill> findAllSkills(){
		return skillRepository.findAll();
	}
	
	@Override
	public Skill saveSkill(Skill skill) {
		return skillRepository.save(skill);
	}

	@Override
	public Skill findSkillById(Long skillId) {
		Skill skill = null;
		if(!skillRepository.findById(skillId).isEmpty()) {
			skill = skillRepository.findById(skillId).get();
		}else {
			throw new ResourceNotFoundException(skillMessage);
		}
		return skill;
	}

	@Override
	public void deleteSkillById(Long skillId) {
		skillRepository.deleteById(skillId);
	}

	@Override
	public Skill updateSkill(Skill skill, Long skillId) {
		Skill foundSkill = skillRepository.findById(skillId).get();
		
		if( null != skill.getSkillName() && !skill.getSkillName().isEmpty()) {
			foundSkill.setSkillName(skill.getSkillName());
		}
		
		if( null != skill.getSkillProficiency() && !skill.getSkillProficiency().isEmpty()) {
			foundSkill.setSkillProficiency(skill.getSkillProficiency());
		}
		
		if( null != skill.getSkillType() && !skill.getSkillType().isEmpty()) {
			foundSkill.setSkillType(skill.getSkillType());
		}
		
		return skillRepository.save(foundSkill);
	}

}
