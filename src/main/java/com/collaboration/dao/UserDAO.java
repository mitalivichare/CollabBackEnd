package com.collaboration.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.collaboration.model.User;

@Repository
public class UserDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public UserDAO(SessionFactory sessionFactory)
	{
		this.sessionFactory=sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}	
	
	
	
	public User get(String id) {
		Session session = sessionFactory.getCurrentSession();
		return session.get(User.class, id);		
	}

	
	public void add(User user) {
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}

	
	public void remove(User user) {
		sessionFactory.getCurrentSession().remove(user);
	}



	public User getByUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM User AS u WHERE u.username=?");
		query.setParameter(0, username);
		return (User)query.uniqueResult();
	}

}
