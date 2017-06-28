package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import pl.mgrz.licznik.model.User;

import javax.servlet.http.HttpSession;

/**
 * Created by Matts on 02.05.2017.
 */
public abstract class AbstractController {

    @Autowired
    private HttpSession session;
    private User loggedUser;

    protected User getLoggedUser() {
        User loggedUser = (User) session.getAttribute("user");
        return loggedUser;
    }
}
