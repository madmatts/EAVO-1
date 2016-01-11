package pl.mgrz.licznik.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import pl.mgrz.licznik.exception.EmailTakenException;
import pl.mgrz.licznik.exception.UserAlreadyExistsException;
import pl.mgrz.licznik.model.User;
 

@Repository
public interface IUserRepository {

	public void addUser(User u) throws UserAlreadyExistsException, EmailTakenException ;

	public User findByUserName(String username) ;
	
	public User findByEmail(String email) ;

	public List<User> listUsers() ;
	
	public List<User> searchUsers(String username) ;

	public void removeUser(int id) ;

	public User getUserById(int id);

	public void updateUser(User u) ;

	public List<User> getData(int pageNumber) ;
	
	public boolean checkIfAdmin(int id) ;

}
