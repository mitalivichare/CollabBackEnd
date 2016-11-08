package com.collaboration.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.collaboration.model.Categories;
import com.collaboration.model.Forums;

@Repository
public class ForumDAO {

	@Autowired
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory ){
		this.sessionFactory = sessionFactory;
	}
		
	
	
	public Forums get(String id) {		
		return this.sessionFactory.getCurrentSession().get(Forums.class, id);
	}

	
	public void add(Forums forum) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(forum);		
	}

	
	public void remove(Forums forum) {
		this.sessionFactory.getCurrentSession().remove(forum);		
	}

	
	public List<Forums> getAll() {		
		return this.sessionFactory.getCurrentSession().createQuery("FROM Forums").list();
	}

	
	public List<Forums> getForumsByCategory(String categoryId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Forums WHERE categoryId = ?");
		query.setParameter(0, categoryId);
		return query.list();
	}

}
