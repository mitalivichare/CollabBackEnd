package com.collaboration.model;

import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Blogs {
	
	@Id
	@Column(name = "blog_id")
	private String id;
	
	
	@NotBlank(message = "Please enter title!")
	private String title;
	
	@NotBlank(message = "Please enter description!")
	private String description;
	
	@DateTimeFormat(pattern = "dd MMM, yyyy HH:mm:ss")
	private Date createdAt;
		
	@DateTimeFormat(pattern = "dd MMM, yyyy HH:mm:ss")
	private Date modifiedAt;
	
	@Column(name = "user_id")
	private String userId;

	@Transient
	@JsonIgnore
	private boolean newBlog;
	
	
	public boolean isNewBlog() {
		return newBlog;
	}


	public void setNewBlog(boolean newBlog) {
		this.newBlog = newBlog;
	}


	public Blogs() {
		this.id = "BLG" + UUID.randomUUID().toString().substring(24).toUpperCase();
	}
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
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

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getModifiedAt() {
		return modifiedAt;
	}

	public void setModifiedAt(Date modifiedAt) {
		this.modifiedAt = modifiedAt;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
	
}
