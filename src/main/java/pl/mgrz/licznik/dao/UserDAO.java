package pl.mgrz.licznik.dao;

import pl.mgrz.licznik.model.portal.User;

import java.util.List;

public interface UserDAO {

    User getUser(String login);
    List<User> getAllUsers();
    void removeUser(String login);
    void registerUser(User user);
    boolean changePassword(String login, String oldpassword, String password);
    void editUser(User user);

}