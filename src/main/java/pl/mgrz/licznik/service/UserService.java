package pl.mgrz.licznik.service;

import pl.mgrz.licznik.model.User;

/**
 * Created by MadMattz on 02.02.2016.
 */
public interface UserService {

    User getUser(String login);
    void registerUser(User user);
}