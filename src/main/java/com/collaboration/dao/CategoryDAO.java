package com.collaboration.dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.collaboration.model.Categories;


@Repository
public class CategoryDAO {

	@Autowired
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory ){
		this.sessionFactory = sessionFactory;
	}
	
	

	public void add(Categories category) {
		this.sessionFactory.getCurrentSession().saveOrUpdate(category);

	}


	public void remove(Categories category) {
		this.sessionFactory.getCurrentSession().remove(category);
	}


	public List<Categories> getAll() {		
		return this.sessionFactory.getCurrentSession().createQuery("FROM Categories").list();
	}

}