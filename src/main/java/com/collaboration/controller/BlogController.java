package com.collaboration.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;
 
import com.collaboration.model.Blog;
import com.collaboration.service.BlogService;
  
@RestController
public class BlogController {
  
    @Autowired
    BlogService blogService;  //Service which will do all data retrieval/manipulation work
  
     
    //-------------------Retrieve All Blogs--------------------------------------------------------
      
    @RequestMapping(value = "/blog/", method = RequestMethod.GET)
    public ResponseEntity<List<Blog>> listAllBlogs() {
        List<Blog> blogs = blogService.findAllBlogs();
        if(blogs.isEmpty()){
            return new ResponseEntity<List<Blog>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Blog>>(blogs, HttpStatus.OK);
    }
  
  
     
    //-------------------Retrieve Single Blog--------------------------------------------------------
      
    @RequestMapping(value = "/blog/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Blog> getBlog(@PathVariable("id") long id) {
        System.out.println("Fetching Blog with id " + id);
        Blog blog = blogService.findById(id);
        if (blog == null) {
            System.out.println("Blog with id " + id + " not found");
            return new ResponseEntity<Blog>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Blog>(blog, HttpStatus.OK);
    }
  
      
      
    //-------------------Create a Blog--------------------------------------------------------
      
    @RequestMapping(value = "/blog/", method = RequestMethod.POST)
    public ResponseEntity<Void> createBlog(@RequestBody Blog blog,    UriComponentsBuilder ucBuilder) {
        System.out.println("Creating Blog " + blog.getTitle());
  
        if (blogService.isBlogExist(blog)) {
            System.out.println("A Blog with name " + blog.getTitle() + " already exist");
            return new ResponseEntity<Void>(HttpStatus.CONFLICT);
        }
  
        blogService.saveBlog(blog);
  
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/blog/{id}").buildAndExpand(blog.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
  
     
      
    //------------------- Update a Blog --------------------------------------------------------
      
    @RequestMapping(value = "/blog/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Blog> updateBlog(@PathVariable("id") long id, @RequestBody Blog blog) {
        System.out.println("Updating Blog " + id);
          
        Blog currentBlog = blogService.findById(id);
          
        if (currentBlog==null) {
            System.out.println("Blog with id " + id + " not found");
            return new ResponseEntity<Blog>(HttpStatus.NOT_FOUND);
        }
  
        currentBlog.setTitle(blog.getTitle());
        currentBlog.setDescription(blog.getDescription());
        currentBlog.setUserid(blog.getUserid());
          
        blogService.updateBlog(currentBlog);
        return new ResponseEntity<Blog>(currentBlog, HttpStatus.OK);
    }
  
     
     
    //------------------- Delete a Blog --------------------------------------------------------
      
    @RequestMapping(value = "/blog/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Blog> deleteBlog(@PathVariable("id") long id) {
        System.out.println("Fetching & Deleting Blog with id " + id);
  
        Blog blog = blogService.findById(id);
        if (blog == null) {
            System.out.println("Unable to delete. Blog with id " + id + " not found");
            return new ResponseEntity<Blog>(HttpStatus.NOT_FOUND);
        }
  
        blogService.deleteBlogById(id);
        return new ResponseEntity<Blog>(HttpStatus.NO_CONTENT);
    }
  
      
     
    //------------------- Delete All Blogs --------------------------------------------------------
      
    @RequestMapping(value = "/blog/", method = RequestMethod.DELETE)
    public ResponseEntity<Blog> deleteAllBlogs() {
        System.out.println("Deleting All Blogs");
  
        blogService.deleteAllBlogs();
        return new ResponseEntity<Blog>(HttpStatus.NO_CONTENT);
    }
  
}

