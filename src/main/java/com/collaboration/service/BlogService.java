package com.collaboration.service;

import java.util.List;

import com.collaboration.model.Blog;

public interface BlogService {

	Blog findById(long id);
    
	Blog findByName(String title);
     
    void saveBlog(Blog blog);
     
    void updateBlog(Blog blog);
     
    void deleteBlogById(long id);
 
    List<Blog> findAllBlogs(); 
     
    void deleteAllBlogs();
    
    public boolean isBlogExist(Blog blog);
}
