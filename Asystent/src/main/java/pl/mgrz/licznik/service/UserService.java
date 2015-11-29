package pl.mgrz.licznik.service;

import java.util.List;

import org.hibernate.exception.ConstraintViolationException;

import pl.mgrz.licznik.model.User;

public interface UserService {
	 
    void saveUser(User user) throws ConstraintViolationException;
     
    List<User> findAllUsers(); 
     
    void deleteUserByName(String name);
    
    User findUser(String username);
    
    User loginUser(String username);
}
