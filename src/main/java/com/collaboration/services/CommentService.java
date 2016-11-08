package com.collaboration.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.collaboration.dao.CommentDAO;
import com.collaboration.model.Comments;

@Service
public class CommentService {

	@Autowired
	private CommentDAO commentDAO;
	public void setCommentDAO(CommentDAO commentDAO) {
		this.commentDAO = commentDAO;
	}
		

	@Transactional
	public Comments get(String id) {
		return this.commentDAO.get(id);
	}

	
	@Transactional
	public List<Comments> getComments(String blogId) {
		return this.commentDAO.getComments(blogId);
	}

	
	@Transactional
	public void add(Comments comment) {
		this.commentDAO.add(comment);
	}

	
	@Transactional
	public void remove(Comments comment) {
		this.commentDAO.remove(comment);
	}
}
