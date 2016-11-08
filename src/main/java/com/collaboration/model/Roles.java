package com.collaboration.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "authorities")
public class Roles {

	@Id
	@Column(name = "user_id")	
	private String id;		

	private String username;
	
	private String authority;


	@Override
	public String toString() {
		return "Role [id=" + id + ", username=" + username + ", authority=" + authority + "]";
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

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}
		
	
}