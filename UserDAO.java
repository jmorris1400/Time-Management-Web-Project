package com.project.dao;

import org.springframework.data.repository.CrudRepository;

import com.project.model.User;

public interface UserDAO extends CrudRepository<User, Long> {
	
	// added by Nemo
	
	// To find user by username while login
	User findByUsername (String username);
	
	 // To determine whether the user is an admin or non-admin user to redirect him/her to the 
    // dedicated page
//	public boolean isAdmin(long id);
	
	// To check if the username and password match the database and authorize login
//    public boolean isAuthorized(String username,String password);
	
	// end of change

}