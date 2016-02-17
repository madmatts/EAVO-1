package pl.mgrz.licznik.controller;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Created by MadMattz on 02.02.2016.
 */
@Controller
@RequestMapping(value = "/account")
public class AccountController {

    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public String loggedIn(HttpSession session, Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (user != null) {
            session.setAttribute("username", user.getUsername());
            session.setAttribute("logged", "true");
            model.addAttribute("login", session.getAttribute("username"));
        } else {
            model.addAttribute("message", "You have to log in to access this page.");
            return "login";
        }
        return "success";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login/logout";
    }
    @RequestMapping(value = "/mypage", method = RequestMethod.GET)
    public String controllPanel(HttpSession session, Model model) {
        model.addAttribute("username", session.getAttribute("username"));
        return "mypage";
    }


}
