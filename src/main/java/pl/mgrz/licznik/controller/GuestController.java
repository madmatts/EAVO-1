package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.mgrz.licznik.model.portal.AlarmType;
import pl.mgrz.licznik.model.portal.User;
import pl.mgrz.licznik.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * Created by MadMattz on 03.02.2016.
 */
@Controller
public class GuestController {

    @Autowired
    private UserService service;
    @Autowired
    private HttpSession session;

    @RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
    public String loginForm(Model model) {
        if (!session.isNew()) {
            return "redirect:/account/mypage";
        }
        return "login";
    }

    @RequestMapping(value = "/login/logout", method = RequestMethod.GET)
    public String loginFormAfterLogout(Model model) {
        String message = "You have been logged out correctly!";
        model.addAttribute("message", message);
        model.addAttribute("error", true);
        return "login";
    }


    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String invalidLogin(Model model) {
        model.addAttribute("afterpost", true);
        model.addAttribute("message", "Your credentials were incorrect.");
        model.addAttribute("alarmtype", AlarmType.DANGER);
        return "login";
    }

    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public String registerForm(Map<String, Object> map) {
        if ("true".equals(session.getAttribute("logged"))) {
            return "redirect:/account/mypage";
        }
        User userForm = new User();
        map.put("userForm", userForm);
        return "register";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String registerAction(@ModelAttribute("userForm") User u, Model model) {

        if (service.getUser(u.getLogin()) == null) {
            service.registerUser(u);
            return "login";
        }
        model.addAttribute("error", true);
        return "register";
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public String registerAction() {
        return "page_403";
    }
}
