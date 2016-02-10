package pl.mgrz.licznik.dao;

import pl.mgrz.licznik.model.User;

public interface UserDAO {

    User getUser(String login);
    void registerUser(User user);


}