package com.collaboration.model;

public class Blog {
	
	private long id;
	
	private String title;
	
	private String description;
	
	private long userid;
	
	

	public Blog(long id, String title, String description, long userid) {
		//super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.userid = userid;
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

	public long getUserid() {
		return userid;
	}

	public void setUserid(long userid) {
		this.userid = userid;
	}
	
	

}
