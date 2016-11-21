package com.collaboration.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import org.springframework.stereotype.Component;
@Entity
@Component
public class Forum {

	@Id
	private long id;
	
	private String title;
	
	private String description;
	
	private long category;
	
	

	public Forum(long id, String title, String description, long category) {
		//super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.category = category;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public long getCategory() {
		return category;
	}

	public void setCategory(long category) {
		this.category = category;
	}
	

}
