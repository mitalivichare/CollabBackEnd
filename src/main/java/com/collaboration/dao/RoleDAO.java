package com.collaboration.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.collaboration.model.Roles;

@Repository
public class RoleDAO {

	@Autowired
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	public void add(Roles role) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(role);
	}
}
