package com.collaboration.service;

import java.util.List;

import com.collaboration.model.Blog;
import com.collaboration.model.Forum;

public interface ForumService {
Forum findById(long id);
    
	Forum findByName(String title);
     
    void saveForum(Forum forum);
     
    void updateForum(Forum forum);
     
    void deleteForumById(long id);
 
    List<Forum> findAllForums(); 
     
    void deleteAllForums();
    
    public boolean isForumExist(Forum forum);

}
