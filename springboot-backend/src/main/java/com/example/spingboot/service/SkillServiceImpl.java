package com.example.spingboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.spingboot.model.Skill;
import com.example.spingboot.repository.SkillRepository;

@Service
public class SkillServiceImpl implements SkillService {
	
	@Autowired
	private SkillRepository skillRepository;
	
	public List<Skill> findAllSkills(){
		return skillRepository.findAll();
	}

}
