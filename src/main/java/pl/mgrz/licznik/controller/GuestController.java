package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.service.UserService;

import java.util.Map;

/**
 * Created by MadMattz on 03.02.2016.
 */
@Controller
public class GuestController {

    @Autowired
    private UserService service;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginForm(Model model) {
        return "login";
    }

    @RequestMapping(value = "/error-login", method = RequestMethod.GET)
    public String invalidLogin(Model model) {
        model.addAttribute("error", true);
        return "login";
    }

    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public String loggedIn(Model model) {
        return "success";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerForm(Model model, Map<String, Object> map) {
        User userForm = new User();
        map.put("userForm", userForm);
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerAction(@ModelAttribute("userForm") User u, Model model) {

        if(service.getUser(u.getLogin()) == null){
            service.registerUser(u);
            return "login";
        }
        model.addAttribute("error", true);
        return "register";
    }
}
