package com.collaboration.model;

import java.util.Date;

public class ForumBasicModel {

	private String forumId;
	private String title;
	private String categoryName;
	private Date createdAt;
	
	public ForumBasicModel() {}
	
	public ForumBasicModel(Categories category, Forums forum) {
		this.categoryName = category.getName();
		this.title = forum.getTitle();
		this.forumId = forum.getId();
		this.createdAt = forum.getCreatedAt();		
	}
	
	
	public String getForumId() {
		return forumId;
	}
	public void setForumId(String forumId) {
		this.forumId = forumId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	
}