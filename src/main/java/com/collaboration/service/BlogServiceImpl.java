package com.collaboration.service;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;
 
import org.springframework.stereotype.Service;
 
import com.collaboration.model.Blog;
 
@Service("blogService")
public class BlogServiceImpl implements BlogService{
     
    private static final AtomicLong counter = new AtomicLong();
     
    private static List<Blog> blogs;
     
    static{
        blogs= populateDummyBlogs();
    }
 
    public List<Blog> findAllBlogs() {
        return blogs;
    }
     
    public Blog findById(long id) {
        for(Blog blog : blogs){
            if(blog.getId() == id){
                return blog;
            }
        }
        return null;
    }
     
    public Blog findByName(String title) {
        for(Blog blog : blogs){
            if(blog.getTitle().equalsIgnoreCase(title)){
                return blog;
            }
        }
        return null;
    }
     
    public void saveBlog(Blog blog) {
        blog.setId(counter.incrementAndGet());
        blogs.add(blog);
    }
 
    public void updateBlog(Blog blog) {
        int index = blogs.indexOf(blog);
        blogs.set(index, blog);
    }
 
    public void deleteBlogById(long id) {
         
        for (Iterator<Blog> iterator = blogs.iterator(); iterator.hasNext(); ) {
        	Blog blog = iterator.next();
            if (blog.getId() == id) {
                iterator.remove();
            }
        }
    }
 
    public boolean isBlogExist(Blog blog) {
        return findByName(blog.getTitle())!=null;
    }
     
    public void deleteAllBlogs(){
        blogs.clear();
    }
 
    private static List<Blog> populateDummyBlogs(){
        List<Blog> blogs = new ArrayList<Blog>();
        /*blogs.add(new Blog(counter.incrementAndGet(),"Sam", "NY", "sam@abc.com"));
        blogs.add(new Blog(counter.incrementAndGet(),"Tomy", "ALBAMA", "tomy@abc.com"));
        blogs.add(new Blog(counter.incrementAndGet(),"Kelly", "NEBRASKA", "kelly@abc.com"));*/
        return blogs;
    }
 
}