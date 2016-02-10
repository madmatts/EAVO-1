package pl.mgrz.licznik.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.mgrz.licznik.dao.UserDAO;
import pl.mgrz.licznik.model.User;

/**
 * Created by MadMattz on 02.02.2016.
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;

    public User getUser(String login) {
        return userDAO.getUser(login);
    }

    public void registerUser(User user) {
        userDAO.registerUser(user);
    }

}
