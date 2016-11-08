package com.collaboration.model;

import java.util.Date;
import java.util.UUID;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
public class Posts {

	@Id
	@Column(name = "post_id")
	private String id;
	
	private String content;	
	
	@Column(name = "forum_id")
	private String forumId;
		
	@Column(name = "user_id")
	private String userId;
		
	@DateTimeFormat(pattern = "dd MMM, yyyy HH:mm:ss")
	private Date postedAt;

	
	public Posts() {
		this.id = "PST" + UUID.randomUUID().toString().substring(24).toUpperCase();
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
	
	public String getForumId() {
		return forumId;
	}


	public void setForumId(String forumId) {
		this.forumId = forumId;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public Date getPostedAt() {
		return postedAt;
	}

	public void setPostedAt(Date postedAt) {
		this.postedAt = postedAt;
	}
		
}
