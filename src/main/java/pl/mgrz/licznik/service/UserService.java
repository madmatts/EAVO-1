package pl.mgrz.licznik.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.mgrz.licznik.dao.UserDao;
import pl.mgrz.licznik.exception.UserAlreadyExistsException;
import pl.mgrz.licznik.model.User;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserDao userDAO;

	public void setUserDAO(UserDao userDAO) {
		this.userDAO = userDAO;
	}

	public void addUser(User u) throws UserAlreadyExistsException {
		this.userDAO.addUser(u);
	}

	@Transactional
	public List<User> listUsers() {
		return this.userDAO.listUsers();
	}

	@Transactional
	public void removeUser(int id) {
		this.userDAO.removeUser(id);
	}

	@Transactional
	public User getUserById(int id) {
		return this.userDAO.getUserById(id);
	}
	
	@Transactional
	public User findUserByName(String username) {
		return this.userDAO.findByUserName(username);
	}

	@Transactional
	public void updateUser(User u) {
		this.userDAO.updateUser(u);
	}

	public List<User> getPage(int pageNumber) {
		return this.userDAO.getData(pageNumber);
	}
	
	public boolean checkIfAdmin(int id){
		return this.userDAO.checkIfAdmin(id);
	}
	
	public List<User> searchUsers(String username) {
		return this.userDAO.searchUsers(username);
	}
}