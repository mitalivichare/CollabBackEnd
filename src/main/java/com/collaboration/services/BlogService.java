package com.collaboration.services;

import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.collaboration.dao.BlogDAO;
import com.collaboration.model.Blogs;
@Service
public class BlogService{

	@Autowired
	private BlogDAO blogDAO;
	public void setBlogDAO(BlogDAO blogDAO) {
		this.blogDAO = blogDAO;
	}
		
	
	@Transactional
	public Blogs get(String id) {
		return this.blogDAO.get(id);
	}

	
	@Transactional
	public List<Blogs> getAll() {
		return this.blogDAO.getAll();
	}

	
	@Transactional
	public List<Blogs> getBlogsByUser(String userId) {
		return this.blogDAO.getBlogsByUser(userId);
	}

	
	@Transactional
	public void add(Blogs blog) {
		if(blog.isNewBlog()) {
			blog.setCreatedAt(new Date());
		}
		blog.setModifiedAt(new Date());		
		this.blogDAO.add(blog);
	}


	@Transactional
	public void remove(Blogs blog) {
		this.blogDAO.remove(blog);
	}

}
