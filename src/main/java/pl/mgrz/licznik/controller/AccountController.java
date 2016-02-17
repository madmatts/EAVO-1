package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import pl.mgrz.licznik.service.UserService;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;

@Controller
@RequestMapping(value = "/account")
public class AccountController {


    @Autowired
    private HttpSession session;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public String loggedIn(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (user != null) {
            session.setAttribute("username", user.getUsername());
            session.setAttribute("user", userService.getUser(user.getUsername()));
            session.setAttribute("logged", true);
            model.addAttribute("login", session.getAttribute("username"));
            model.addAttribute("logged", session.getAttribute("logged"));
        } else {
            model.addAttribute("message", "You have to log in to access this page.");
            return "login";
        }
        return "success";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        session.setAttribute("logged", "");
        session.setAttribute("username", "");
        session.setAttribute("user", null);
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

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String viewProfil(HttpSession session, Model model) {
        if(session.getAttribute("logged").equals(false)){
            return "redirect: /login";
        }
        model.addAttribute("username", session.getAttribute("username"));
        model.addAttribute("user", session.getAttribute("user"));
        return "myprofile";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String handleFormUpload(
            @RequestParam("file") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
            File destination = new File("File directory with file name"); // something like C:/Users/tom/Documents/nameBasedOnSomeId.png
            ImageIO.write(src, "png", destination);
            //Save the id you have used to create the file name in the DB. You can retrieve the image in future with the ID.
        }
        return "myprofile";
    }

}
