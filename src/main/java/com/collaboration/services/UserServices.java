package com.collaboration.services;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.collaboration.dao.UserDAO;
import com.collaboration.model.Roles;
import com.collaboration.model.User;
import com.collaboration.model.UserProfiles;

@Service
public class UserServices {

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private EmailService mailService;
	
	@Autowired
	private UserDAO userDAO;
	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	
	@Transactional
	public User get(String id) {		
		return this.userDAO.get(id);		
	}

	
	
	@Transactional	
	public User getByUsername(String username) {		
		return this.userDAO.getByUsername(username);
	}
	
	
	
	
	@Transactional
	public void add(UserProfiles profile) {
		
		// Create a new user
		User user = new User();
		// Create a role
		
		// set the time-stamp
		profile.setCreatedAt(new Date());
		profile.setModifiedAt(new Date());
		
		// set the initial value for the user profile
		profile.setNoOfBlogs(new Long(0));
		profile.setNoOfPosts(new Long(0));
		profile.setNoOfFriends(new Long(0));
		
		if(profile.getGender() == 'M') {
			profile.setAvatar("male.jpg");
		}
		else {
			profile.setAvatar("female.jpg");
		}
		
		// set the user details from profile details
		user.setUsername(profile.getEmailAddress());
		user.setPassword(profile.getRegisterPassword());
		user.setEnabled(true);

		
		
		// set the details about user and profile to and from for bi-directional
		profile.setUser(user);
		user.setUserProfile(profile);
		
		// assign the role
		Roles role = new Roles();
		role.setId(user.getId());
		role.setUsername(profile.getEmailAddress());
		// Un-Comment the below line for adding an administrator and comment the below line
		//role.setAuthority("ROLE_ADMIN");
		// comment the above line and uncomment the below line for adding a normal user
		role.setAuthority("ROLE_USER");
		
		this.roleService.add(role);
		this.userDAO.add(user);
		
		/*
		 * ---------------------------------------------------------
		 * Will shoot an email here to work with activation right
		 * now by default the user profile will be activated
		 * ---------------------------------------------------------
		 * */
		this.mailService.sendMail(profile.getEmailAddress(), "NEW USER REGISTRATION", "Welcome to Sahar Site <br/> You have Registered Sucessfully");
		
	}

	
	@Transactional
	public void remove(User user) {
		this.userDAO.remove(user);
	}

}