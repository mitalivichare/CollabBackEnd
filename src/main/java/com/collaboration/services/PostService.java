package com.collaboration.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.collaboration.dao.PostDAO;
import com.collaboration.model.Posts;

@Service
public class PostService {

	@Autowired
	private PostDAO postDAO;
	public void setPostDAO(PostDAO postDAO) {
		this.postDAO = postDAO;
	}
	
	
	
	@Transactional
	public void add(Posts post) {
		this.postDAO.add(post);

	}

	
	@Transactional
	public void remove(Posts post) {
		this.postDAO.remove(post);
	}

	
	@Transactional
	public List<Posts> getPostsByForum(String forumId) {		
		return this.postDAO.getPostsByForum(forumId);
	}

	
	@Transactional
	public Posts get(String postId) {		
		return this.postDAO.get(postId);
	}

}

