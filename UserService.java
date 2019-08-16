package com.project.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.dao.UserDAO;
import com.project.model.Machine;
import com.project.model.User;

@Component
public class UserService {
	
    @Autowired UserDAO repository;
    
    public void add(User user) {
        repository.save(user);
    }
    public void delete(long id) {
        repository.deleteById(id);
    }
    public List<User> getUsers() {
        return (List<User>) repository.findAll();
    }
    public User getUserById(long id) {
    	return (User) repository.findById(id).orElse(null);
    }
    
    //added by Nemo
    
    // To find user by username while login
    public User getUserByUsername (String username) {
    	return (User) repository.findByUsername(username);
    }
    
    
    // To determine whether the user is an admin or non-admin user to redirect him/her to the 
    // dedicated page
    public boolean isAdminById(long id) {
    	User user = new User();
    	user = getUserById(id);
    	
    	if(user.isIs_admin())
    		return true;
    	else
    		return false;
    }
    
    public boolean isAdminByUserName(String username) {
    	User user = new User();
    	user = getUserByUsername(username);
    	
    	if(user.isIs_admin())
    		return true;
    	else
    		return false;
    }
    
    
    // To check if the username and password match the database and authorize login
    public boolean isAuthorized(String username,String password) {
    	User user = new User();
    	user = getUserByUsername(username);
    	if (user != null) {
    		if (user.getUsername().equals(username) && user.getPassword().equals(password))
    			return true;
    		else
    			return false;   		
    	}else
    		return false;
    }
    
    // end of change

}