package com.collaboration.model;

import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "user_auth")
public class User {

	
	@Id
	@Column(name = "user_id")	
	private String id;		
	
	private String username;
	
	private String password;
	
	private boolean enabled;
	
	private String activationToken;
	
	@Transient
	private String confirmPassword;
	
	@OneToOne(mappedBy="user", cascade = CascadeType.ALL)
	private UserProfiles userProfile;
			
	
	public User() {
		this.id = "USR" + UUID.randomUUID().toString().substring(24).toUpperCase();
		this.activationToken = UUID.randomUUID().toString().substring(24).toUpperCase();
	}


	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", activationToken=" + activationToken + ", confirmPassword=" + confirmPassword + "]";
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getUsername() {
		return username;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public boolean isEnabled() {
		return enabled;
	}


	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}


	public UserProfiles getUserProfile() {
		return userProfile;
	}


	public void setUserProfile(UserProfiles userProfile) {
		this.userProfile = userProfile;
	}
			
	
}