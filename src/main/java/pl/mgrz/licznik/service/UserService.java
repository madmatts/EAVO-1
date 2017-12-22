package pl.mgrz.licznik.service;

import pl.mgrz.licznik.model.portal.User;

import java.util.List;

public interface UserService {

    User getUser(String login);
    List<User> getAllUsers();
    void removeUser(String login);
    void registerUser(User user);
    boolean changePassword(String login, String oldpassword, String password);
    void editUser(User user);
}