package pl.mgrz.licznik.dao;

import java.util.List;

import org.hibernate.exception.ConstraintViolationException;

import pl.mgrz.licznik.model.User;
 
public interface UserDao {
	 
    void saveUser(User user) throws ConstraintViolationException;
    List<User> findAllUsers(); 
    void deleteUserByName(String name);
    User findByUserName(String username);
}