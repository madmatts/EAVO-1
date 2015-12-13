package pl.mgrz.licznik.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.mgrz.licznik.exception.UserAlreadyExistsException;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	int pageNumber;
	@Autowired
	UserService service;

	@RequestMapping(value = { "/register" }, method = RequestMethod.GET)
	public String newUser(ModelMap model) {
		User user = new User();
		model.addAttribute("user", user);
		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String processRegistration(
			@Valid @ModelAttribute("userForm") User user, BindingResult result,
			Model model) {

		try {
			this.service.addUser(user);
		} catch (UserAlreadyExistsException e) {
			return "register";
		}

		model.addAttribute("username", user.getUsername());
		model.addAttribute("email", user.getEmail());
		return "success";
	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public String adminPage(Model model) {

		model.addAttribute("title", "Spring Security + Hibernate Example");
		model.addAttribute("message", "This page is for ROLE_ADMIN only!");

		return "admin";

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}

	
	@RequestMapping(value = "/allusers", method = RequestMethod.GET)
	public String getAllUsers(Model model) {
		
		List<User> users = new ArrayList<User>();
		
		users = service.listUsers();
		
		model.addAttribute("users", users);

		return "allusers";
	}

	@RequestMapping(value = "/loginForm", method = RequestMethod.GET)
	public String viewLoginForm(Model model) {
		model.addAttribute("userForm", new User());

		return "login";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String viewLogout() {

		return "logoutPage";
	}


	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String accesssDenied(Model model) {

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addAttribute("username", userDetail.getUsername());

		}

		return "403";

	}

}
