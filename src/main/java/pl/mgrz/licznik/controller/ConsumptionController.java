package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.mgrz.licznik.service.UserService;

import javax.servlet.http.HttpSession;

/**
 * Created by MadMattz on 22.02.2016.
 */
@Controller
@RequestMapping(value = "/consumption")

public class ConsumptionController {

    @Autowired
    HttpSession session;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerConsumption(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (user != null) {
            session.setAttribute("username", user.getUsername());
            session.setAttribute("user", userService.getUser(user.getUsername()));
            session.setAttribute("logged", true);
            model.addAttribute("login", session.getAttribute("username"));
            model.addAttribute("logged", session.getAttribute("logged"));
        } else {
            model.addAttribute("message", "You have to log in to access this page.");
            return "redirect:/login";
        }
        return "registerConsumption";
    }

}
