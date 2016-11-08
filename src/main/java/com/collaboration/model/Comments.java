package com.collaboration.model;


import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table (name = "blog_comment")
public class Comments {
	
	@Id
	private String id;
	
	private String content;
	
	@Column(name = "blog_id")
	private String blogId;
	
	@Column(name = "user_id") 
	private String userId;
	
	@DateTimeFormat(pattern = "dd MMM, yyyy HH:mm:ss")
	private Date commentedAt;

	
	public Comments() {
		this.id = "CMT" + UUID.randomUUID().toString().substring(24).toUpperCase();
	}
	
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getBlogId() {
		return blogId;
	}

	public void setBlogId(String blogId) {
		this.blogId = blogId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getCommentedAt() {
		return commentedAt;
	}

	public void setCommentedAt(Date commentedAt) {
		this.commentedAt = commentedAt;
	}
		
}
