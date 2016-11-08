package com.collaboration.services;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.collaboration.dao.ForumDAO;
import com.collaboration.model.Forums;

@Service
public class ForumService  {

	@Autowired
	private ForumDAO forumDAO;
	public void setForumDAO(ForumDAO forumDAO) {
		this.forumDAO = forumDAO;
	}

	
	@Transactional
	public Forums get(String id) {
		return this.forumDAO.get(id);
	}

	
	@Transactional
	public void add(Forums forum) {
		if(forum.isNewForum()) {
			forum.setCreatedAt(new Date());
		}
		forum.setModifiedAt(new Date());
		this.forumDAO.add(forum);
	}

	
	@Transactional
	public void remove(Forums forum) {
		this.forumDAO.remove(forum);
	}

	
	@Transactional
	public List<Forums> getAll() {
		return this.forumDAO.getAll();
	}

	
	@Transactional
	public List<Forums> getForumsByCategory(String categoryId) {
		return this.forumDAO.getForumsByCategory(categoryId);
	}

}
