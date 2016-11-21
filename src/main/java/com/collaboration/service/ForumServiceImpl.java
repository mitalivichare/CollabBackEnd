package com.collaboration.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicLong;

import com.collaboration.model.Forum;

public class ForumServiceImpl implements ForumService {

	private static final AtomicLong counter = new AtomicLong();
    
    private static List<Forum> forums;
     
    static{
        forums= populateDummyForums();
    }
 
    public List<Forum> findAllForums() {
        return forums;
    }
     
    public Forum findById(long id) {
        for(Forum forum : forums){
            if(forum.getId() == id){
                return forum;
            }
        }
        return null;
    }
     
    public Forum findByName(String title) {
        for(Forum forum : forums){
            if(forum.getTitle().equalsIgnoreCase(title)){
                return forum;
            }
        }
        return null;
    }
     
    public void saveForum(Forum forum) {
        forum.setId(counter.incrementAndGet());
        forums.add(forum);
    }
 
    public void updateForum(Forum forum) {
        int index = forums.indexOf(forum);
        forums.set(index, forum);
    }
 
    public void deleteForumById(long id) {
         
        for (Iterator<Forum> iterator = forums.iterator(); iterator.hasNext(); ) {
        	Forum forum = iterator.next();
            if (forum.getId() == id) {
                iterator.remove();
            }
        }
    }
 
    public boolean isForumExist(Forum forum) {
        return findByName(forum.getTitle())!=null;
    }
     
    public void deleteAllForums(){
        forums.clear();
    }
 
    private static List<Forum> populateDummyForums(){
        List<Forum> forums = new ArrayList<Forum>();
        /*forums.add(new Forum(counter.incrementAndGet(),"Sam", "NY", "sam@abc.com"));
        forums.add(new Forum(counter.incrementAndGet(),"Tomy", "ALBAMA", "tomy@abc.com"));
        forums.add(new Forum(counter.incrementAndGet(),"Kelly", "NEBRASKA", "kelly@abc.com"));*/
        return forums;
    }
}
