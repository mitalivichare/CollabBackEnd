package com.collaboration.dao;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.collaboration.model.UserProfiles;
@Repository
public class UserProfileDAO {

	@Autowired
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	
	public UserProfiles get(String id) {		
		Session session = sessionFactory.getCurrentSession();
		return session.get(UserProfiles.class, id);
	}

	
	public void add(UserProfiles profile) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(profile);
	}

	
	public void remove(UserProfiles profile) {
		Session session = sessionFactory.getCurrentSession();
		session.remove(profile);
	}

}
