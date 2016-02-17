package pl.mgrz.licznik.service;

import pl.mgrz.licznik.model.User;

public interface UserService {

    User getUser(String login);
    void registerUser(User user);
}