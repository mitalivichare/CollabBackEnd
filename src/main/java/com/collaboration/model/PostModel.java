package com.collaboration.model;

import java.util.Date;

public class PostModel {
	
	private String firstName;
	private String lastName;	
	private String content;
	private Date postedAt;
	
	public PostModel() {}
	
	public PostModel(Posts post, UserProfiles profile) {
		this.firstName = profile.getFirstName();
		this.lastName = profile.getLastName();
		this.content = post.getContent();
		this.postedAt = post.getPostedAt();
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getPostedAt() {
		return postedAt;
	}

	public void setPostedAt(Date postedAt) {
		this.postedAt = postedAt;
	}	
		
}
