package com.collaboration.model;
import java.util.Date;



public class BlogBasicModel {

	
	private String blogId;
	private String title;
	private Date createdAt;
	private String firstName;
	private String lastName;
	
	
	public BlogBasicModel() {}
	
	public BlogBasicModel(Blogs blog, UserProfiles profile) {
		
		this.blogId = blog.getId();
		this.title = blog.getTitle();
		this.createdAt = blog.getCreatedAt();
		this.firstName = profile.getFirstName();
		this.lastName = profile.getLastName();
		
	}
	
	@Override
	public String toString() {
		return "BlogBasicModel [blogId=" + blogId + ", title=" + title + ", createdAt=" + createdAt + ", firstName="
				+ firstName + ", lastName=" + lastName + "]";
	}
	public String getBlogId() {
		return blogId;
	}
	public void setBlogId(String blogId) {
		this.blogId = blogId;
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
	
}