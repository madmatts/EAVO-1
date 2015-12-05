package pl.mgrz.licznik.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.service.RefuelService;

@Controller
@RequestMapping("/refuel")
public class RefuelController {

	@Autowired
	private RefuelService service;

	@RequestMapping(value = { "/refill" }, method = RequestMethod.GET)
	public String showRefill(HttpSession session, ModelMap model) {

		User user = (User) session.getAttribute("loggedUser");
		if (user == null)
			return "redirect:/account/login";

		Refuel refuel = new Refuel();
		model.addAttribute("refuel", refuel);
		return "refill";
	}

	@RequestMapping(value = { "/refill" }, method = RequestMethod.POST)
	public String newRefill(@Valid @ModelAttribute("refuel") Refuel refuel,
			HttpSession session, ModelMap model) {

		User user = (User) session.getAttribute("loggedUser");
		if (user == null)
			return "redirect:/account/login";

		this.service.saveRefuel(user, refuel);

		model.addAttribute("amount", refuel.getAmount());
		model.addAttribute("cost", refuel.getCost());
		model.addAttribute("date", refuel.getDate());
		model.addAttribute("fuelstation", refuel.getFuelstation());

		return "refuels";
	}

	@RequestMapping(value = { "/refuels" }, method = RequestMethod.GET)
	public String showRefuels(HttpSession session, ModelMap model) {

		User user = (User) session.getAttribute("loggedUser");
		if (user == null)
			return "redirect:/account/login";

		List<Refuel> refuels = service.findRefuelsForUser(user.getId());

		model.addAttribute("listRefuels", refuels);

		return "refuels";
	}

}
