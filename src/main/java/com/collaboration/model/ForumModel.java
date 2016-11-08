package com.collaboration.model;

import java.util.List;

public class ForumModel {

	private Categories category;
	private List<Forums> forums;

	
	public List<Forums> getForums() {
		return forums;
	}
	public void setForums(List<Forums> forums) {
		this.forums = forums;
	}
	public Categories getCategory() {
		return category;
	}
	public void setCategory(Categories category) {
		this.category = category;
	}
	
	
}
