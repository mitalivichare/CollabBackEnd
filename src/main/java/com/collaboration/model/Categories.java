package com.collaboration.model;

import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.validator.constraints.NotBlank;

@Entity
public class Categories {

	@Id
	@Column(name = "category_id")
	private String id;
	
	@NotBlank(message = "Please enter the name of category!")
	private String name;
	
	@NotBlank(message = "Please enter the description for the category!")
	private String description;

	
	@NotBlank(message = "Please enter the description for the category!") 
	public Categories() {
		this.id = "CTG" + UUID.randomUUID().toString().substring(24).toUpperCase();
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
		
}