package com.collaboration.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
public class ForumViewModel   {

	private String description;
	private String title;
	private Date createdAt;
	private List<PostModel> posts;
			
		public ForumViewModel() {}
	
	public ForumViewModel(Forums forum) {
		
		this.description = forum.getDescription();
		this.title = forum.getTitle();
		this.createdAt = forum.getCreatedAt();
		posts = new ArrayList<PostModel>(); 
	}
	
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public List<PostModel> getPosts() {
		return posts;
	}
	public void setPosts(List<PostModel> posts) {
		this.posts = posts;
	}

	public void add(PostModel postModel) {	
		this.posts.add(postModel);
	}
		
}