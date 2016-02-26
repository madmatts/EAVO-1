package pl.mgrz.licznik.service;

import pl.mgrz.licznik.model.User;

import java.util.List;

public interface UserService {

    User getUser(String login);
    List<User> getAllUsers();
    void removeUser(String login);
    void registerUser(User user);
}