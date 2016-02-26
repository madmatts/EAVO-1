package pl.mgrz.licznik.dao;

import pl.mgrz.licznik.model.User;

import java.util.List;

public interface UserDAO {

    User getUser(String login);
    List<User> getAllUsers();
    void removeUser(String login);
    void registerUser(User user);


}