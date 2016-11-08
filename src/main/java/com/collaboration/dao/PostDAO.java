package com.collaboration.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.collaboration.model.Posts;

@Repository
public class PostDAO  {

	@Autowired
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	

	public void add(Posts post) {		
		this.sessionFactory.getCurrentSession().saveOrUpdate(post);
	}


	public void remove(Posts post) {
		this.sessionFactory.getCurrentSession().remove(post);

	}


	public List<Posts> getPostsByForum(String forumId) {
/*		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Post p, UserProfile u WHERE p.userId = u.id and p.forumId = ?");
		query.setParameter(0, forumId);
		return query.list();
*/	
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("FROM Posts p WHERE p.forumId = ? order by p.postedAt desc");
		query.setParameter(0, forumId);
		return query.list(); 
	}


	public Posts get(String postId) {		
		return this.sessionFactory.getCurrentSession().get(Posts.class, postId);
	}

}