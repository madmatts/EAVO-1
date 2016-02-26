package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value="/admin")
public class AdminController {
    @Autowired
    private HttpSession session;
    @Autowired
    private UserService userService;


//    @RequestMapping(value="/")
//    public String getDashboard() {
//
//        return "admin";
//    }

    @RequestMapping(value="/userlist")
    public String allUsers(Model model) {
        List<User> userList = userService.getAllUsers();
        model.addAttribute("userList", userList);

        return "userlist";
    }

    @RequestMapping(value = "/viewuser/{login}", method = RequestMethod.GET)
    public String viewProfil(@PathVariable String login, HttpSession session, Model model) {

        User user = userService.getUser(login);

        model.addAttribute("username", user.getLogin());
        model.addAttribute("user", user);
        return "myprofile";
    }

    @RequestMapping(value = "/remove/{login}", method = RequestMethod.GET)
    public String removeUser(@PathVariable String login, HttpSession session, Model model) {

        userService.removeUser(login);
        return "redirect:/admin/userlist";
    }

}
