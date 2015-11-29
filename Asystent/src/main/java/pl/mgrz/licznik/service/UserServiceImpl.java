package pl.mgrz.licznik.service;

import java.util.List;

import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.mgrz.licznik.dao.UserDao;
import pl.mgrz.licznik.model.User;

@Service("userService")
@Transactional
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao dao;

	public void saveUser(User user) throws ConstraintViolationException {
		dao.saveUser(user);
	}

	public List<User> findAllUsers() {
		return dao.findAllUsers();
	}

	public void deleteUserByName(String name) {
		dao.deleteUserByName(name);
	}

	public User findUser(String username) {
		return dao.findByUserName(username);
	}

	public User loginUser(String username, String password) {
		User user = this.findUser(username);

		if (user != null && user.getPassword().equals(password))
			return user;
		
		return null;
	}

	@Override
	public User loginUser(String username) {
		// TODO Auto-generated method stub
		return null;
	}

}