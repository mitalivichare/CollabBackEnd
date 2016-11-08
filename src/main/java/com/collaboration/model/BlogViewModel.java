package com.collaboration.model;
import java.util.ArrayList;
import java.util.List;



public class BlogViewModel extends BlogBasicModel {

	
	private String description;
	private List<CommentModel> comments;
			
	public BlogViewModel(Blogs blog, UserProfiles profile) {
		super(blog,profile);
		this.description = blog.getDescription();
		comments = new ArrayList<CommentModel>();
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public void add(CommentModel commentModel) {
		this.comments.add(commentModel);
	}

	public List<CommentModel> getComments() {
		return comments;
	}

	public void setComments(List<CommentModel> comments) {
		this.comments = comments;
	}		
	
}