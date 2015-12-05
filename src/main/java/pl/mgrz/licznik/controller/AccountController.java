package pl.mgrz.licznik.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import pl.mgrz.licznik.exception.UserAlreadyExistsException;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.service.UserService;

@Controller
@RequestMapping("/account")
public class AccountController {

	private UserService service;
	private static int pageNumber;
	private static final int SESSION_DURATION = 60 * 60; // 60 seconds * 60
															// minutes

	@Autowired(required = true)
	@Qualifier(value = "userService")
	public void setUserService(UserService us) {
		this.service = us;
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String viewRegistration(HttpSession session, Model model) {

		if ((User) session.getAttribute("loggedUser") != null)
			return "redirect:/account/mypage";

		model.addAttribute("userForm", new User());

		return "register";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String processRegistration(
			@Valid @ModelAttribute("userForm") User user, BindingResult result,
			Model model) {

		if (result.hasErrors()) {
			return "register";
		}

		try {
			this.service.addUser(user);
		} catch (UserAlreadyExistsException e) {
			model.addAttribute("notification",
					"Uzytkownik o takim adresie email juz istenieje!");
			return "register";
		}

		return "registrationSuccess";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String viewLoginForm(HttpSession session, Model model) {

		if ((User) session.getAttribute("loggedUser") != null)
			return "redirect:/account/mypage";

		User user = new User();
		model.addAttribute("userLogin", user);

		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(
			// @ModelAttribute User user
			@RequestParam String username, @RequestParam String password,
			HttpSession session, Model model) {

		User user = service.findUserByName(username);
		if (user == null || !user.getPassword().equals(password)) {
			model.addAttribute("errorMsg",
					"B³êdne dane logowanie. Spróbuj jeszcze raz!");
			return "login";
		}
		session.setAttribute("loggedUser", user);
		session.setMaxInactiveInterval(SESSION_DURATION);

		return "redirect:/account/mypage";
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String loginSuccess(HttpSession session, Model model) {
		boolean isAdmin = false;

		User sessionUser = (User) session.getAttribute("loggedUser");
		try {
			isAdmin = service.checkIfAdmin(sessionUser.getId());
		} catch (Exception e) {
			return "redirect:/account/login";
		}

		model.addAttribute("isAdmin", isAdmin);

		return "loginsuccess";
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String viewLogout(HttpSession session) {
		session.removeAttribute("loggedUser");
		return "login";
	}

	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String error() {

		return "error";
	}

	@RequestMapping(value = "/users/{nr}/search/{bool}", method = RequestMethod.GET)
	public String listPersons(@PathVariable("nr") int nr,
			@PathVariable("bool") boolean bool, HttpSession session, Model model) {

		boolean isAdmin = false;

		User sessionUser = (User) session.getAttribute("loggedUser");
		try {
			isAdmin = service.checkIfAdmin(sessionUser.getId());
			if (!isAdmin) {
				return "redirect:/account/mypage";
			}
		} catch (Exception e) {
			return "redirect:/account/login";
		}

		User u = new User();
		pageNumber = nr;
		boolean hasNextPage = false;
		if (this.service.getPage(nr + 1).size() > 0)
			hasNextPage = true;

		model.addAttribute("user", u);
		model.addAttribute("pageNumber", nr);
		model.addAttribute("listUsers", this.service.getPage(nr));
		model.addAttribute("search", bool);
		model.addAttribute("hasNextPage", hasNextPage);

		return "users";
	}

	@RequestMapping("/adminRemoveUser/{id}")
	public String removeUser(@PathVariable("id") int id) {

		this.service.removeUser(id);
		if (this.service.getPage(pageNumber).size() == 0)
			pageNumber--;
		return "redirect:/account/users/1";
	}

	@RequestMapping(value = "/adminEditUser/{id}/page/{nr}", method = RequestMethod.GET)
	public String editUser(@PathVariable("id") int id,
			@PathVariable("nr") int nr, HttpSession session, Model model) {
		boolean isAdmin = false;

		User sessionUser = (User) session.getAttribute("loggedUser");
		try {
			isAdmin = service.checkIfAdmin(sessionUser.getId());
			if (!isAdmin) {
				return "redirect:/account/mypage";
			}
		} catch (Exception e) {
			return "redirect:/account/login";
		}

		model.addAttribute("user", this.service.getUserById(id));
		model.addAttribute("pageNumber", nr);

		model.addAttribute("listUsers", this.service.getPage(nr));
		return "users";
	}

	@RequestMapping(value = "/adminUpdateUser", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute(value = "user") User user,
			Model model) {

		this.service.updateUser(user);
		return "redirect:/account/mypage";

	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String listPersons(
			@RequestParam(value = "nameOfUser") String username,
			HttpSession session, Model model) {

		boolean isAdmin = false;

		User sessionUser = (User) session.getAttribute("loggedUser");
		
		try {
			isAdmin = service.checkIfAdmin(sessionUser.getId());
			if (!isAdmin) {
				return "redirect:/account/mypage";
			}
		} catch (Exception e) {
			return "redirect:/account/login";
		}

		
		model.addAttribute("pageNumber", 1);
		model.addAttribute("listUsers", service.searchUsers(username));
		model.addAttribute("search", true);
		
		return "users";
	}
}