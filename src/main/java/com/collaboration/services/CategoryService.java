package com.collaboration.services;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.collaboration.dao.CategoryDAO;
import com.collaboration.model.Categories;;

@Service
public class CategoryService {

	@Autowired
	private CategoryDAO categoryDAO;
	public void setCategoryDAO(CategoryDAO categoryDAO) {
		this.categoryDAO = categoryDAO;
	}
		
	
	@Transactional
	public void add(Categories category) {
		this.categoryDAO.add(category);
	}

	
	@Transactional
	public void remove(Categories category) {
		this.categoryDAO.remove(category);
	}

	
	@Transactional
	public List<Categories> getAll() {		
		return this.categoryDAO.getAll();
	}

	
	@Transactional
	public Map<String, String> getCategories() {		
		List<Categories> categoryList = this.getAll();
		LinkedHashMap<String,String> map = new LinkedHashMap<String,String>();
		for(Categories category: categoryList) {
			map.put(category.getId(), category.getName());
		}		
		return map;
	}

}