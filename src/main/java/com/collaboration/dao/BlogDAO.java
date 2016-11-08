package com.collaboration.dao;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.collaboration.model.Blogs;
import com.collaboration.model.UserProfiles;

@Repository
public class BlogDAO {

	
	@Autowired
	private SessionFactory sessionFactory;
	
	public BlogDAO(SessionFactory sessionFactory)
	{
		this.sessionFactory=sessionFactory;
	}
	public void setSessionFactory(SessionFactory sessionFactory ){
		this.sessionFactory = sessionFactory;
	}

	public Blogs get(String id) {		
		return this.sessionFactory.getCurrentSession().get(Blogs.class, id);
	}


	public List<Blogs> getAll() {		
		return this.sessionFactory.getCurrentSession().createQuery("FROM Blogs ORDER BY createdAt DESC").list();
	}


	public List<Blogs> getBlogsByUser(String userId) {		
		return this.sessionFactory.getCurrentSession().createQuery("FROM Blogs WHERE userId=?").setParameter(0, userId).list();
	}


	public void add(Blogs blog) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(blog);
	}


	public void remove(Blogs blog) {
		this.sessionFactory.getCurrentSession().remove(blog);
	}

}