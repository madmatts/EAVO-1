package pl.mgrz.licznik.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.mgrz.licznik.dao.UserDAO;
import pl.mgrz.licznik.model.User;

import java.util.List;

@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    public User getUser(String login) {
        return userDAO.getUser(login);
    }

    public List<User> getAllUsers() {
        return userDAO.getAllUsers();
    }

    public void removeUser(String login) {
        userDAO.removeUser(login);
    }

    public void registerUser(User user) {
        userDAO.registerUser(user);
    }

}
