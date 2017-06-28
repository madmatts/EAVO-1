package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import pl.mgrz.licznik.model.AlarmType;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.model.Vehicle;
import pl.mgrz.licznik.service.UserService;
import pl.mgrz.licznik.service.VehicleService;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(value = "/account")
public class AccountController {

    @Autowired
    private HttpSession session;
    @Autowired
    private UserService userService;
    @Autowired
    private VehicleService vehicleService;

    @RequestMapping(value = "/success", method = RequestMethod.GET)
    public String loggedIn(Model model) {
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (user != null) {
            session.setAttribute("username", user.getUsername());
            session.setAttribute("user", userService.getUser(user.getUsername()));
            session.setAttribute("logged", true);
            session.setAttribute("role", userService.getUser(user.getUsername()).getRole().getRole());
            model.addAttribute("login", session.getAttribute("username"));
            model.addAttribute("logged", session.getAttribute("logged"));

        }
        return "redirect:/account/mypage";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutPage(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        session.setAttribute("logged", false);
        session.setAttribute("username", "");
        session.setAttribute("user", null);
        session.invalidate();
        if (auth != null) {
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        return "redirect:/login/logout";
    }

    @RequestMapping(value = "/mypage", method = RequestMethod.GET)
    public String controllPanel(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        List<Vehicle> vehicleList = vehicleService.getVehiclesByUser(user.getId());
        session.setAttribute("vehicleList", vehicleList);

//        model.addAttribute("username", session.getAttribute("username"));
        model.addAttribute("vehicleList", vehicleList);

        return "mypage";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String viewProfil(HttpSession session, Model model) {
        if (session.getAttribute("logged").equals(false)) {
            return "redirect: /login";
        }
        model.addAttribute("avatar", "/resources/images/avatars/default.jpg");
        model.addAttribute("username", session.getAttribute("username"));
        model.addAttribute("user", session.getAttribute("user"));
        return "myprofile";
    }


    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String handleFormUpload(
            @RequestParam("file") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
            File destination = new File("/WEB-INF/resources/images/avatars");
            ImageIO.write(src, "jpg", destination);
            //Save the id you have used to create the file name in the DB. You can retrieve the image in future with the ID.
        }
        return "myprofile";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.GET)
    public String getRemoveAccountForm(HttpSession session, Model model) {
        model.addAttribute("username", session.getAttribute("username"));
        model.addAttribute("user", session.getAttribute("user"));
        return "removeAccount";
    }

    @RequestMapping(value = "/remove", method = RequestMethod.POST)
    public String removeAccount(HttpSession session, Model model) {
        userService.removeUser((String) session.getAttribute("username"));
        return "home";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editAccount(HttpSession session, Model model) {
        model.addAttribute("username", session.getAttribute("username"));
        model.addAttribute("user", session.getAttribute("user"));
        return "editAccount";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editAccountPost(HttpSession session, Model model, @RequestParam("user") String email) {
        pl.mgrz.licznik.model.User user = (pl.mgrz.licznik.model.User) session.getAttribute("user");
        if (!email.isEmpty()) {
            user.setEmail(email);
        }
        userService.editUser(user);
        model.addAttribute("alarmtype", AlarmType.SUCCESS);
        model.addAttribute("message", "Account edited sucessfuly");
        model.addAttribute("afterpost", true);
        return "editAccount";
    }

    @RequestMapping(value = "/changePassword", method = RequestMethod.POST)
    public String changePassword(Model model, @RequestParam(value = "oldPassword") String oldPassword, @RequestParam("password") String password) {

        if (userService.changePassword((String) session.getAttribute("username"), password, oldPassword)) {
            model.addAttribute("alarmtype", AlarmType.SUCCESS);
            model.addAttribute("message", "Password changed sucessfuly");
            model.addAttribute("afterpost", true);
        } else {
            model.addAttribute("alarmtype", AlarmType.DANGER);
            model.addAttribute("message", "Password password does not match. Please try again.");
            model.addAttribute("afterpost", true);
        }
        return "editAccount";
    }


}
