package com.example.spingboot.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "skills")
public class Skill {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private long id;
	
	@Column(name = "skill_type")
	private String skillType;
	
	@Column(name = "skill_name")
	private String skillName;
	
	@Column(name = "skill_proficiency")
	private String skillProficiency;
	
	public Skill() {		
	}

	public Skill(String skillType, String skillName, String skillProficiency) {
		super();
		this.skillType = skillType;
		this.skillName = skillName;
		this.skillProficiency = skillProficiency;
	}

	public String getSkillType() {
		return skillType;
	}

	public void setSkillType(String skillType) {
		this.skillType = skillType;
	}

	public String getSkillName() {
		return skillName;
	}

	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}

	public String getSkillProficiency() {
		return skillProficiency;
	}

	public void setSkillProficiency(String skillProficiency) {
		this.skillProficiency = skillProficiency;
	}

}
