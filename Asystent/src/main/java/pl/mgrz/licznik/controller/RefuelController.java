package pl.mgrz.licznik.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.service.RefuelService;

@Controller
@RequestMapping("/refuel")
public class RefuelController {
	
	@Autowired
	private RefuelService service;

	@RequestMapping(value = { "/refill" }, method = RequestMethod.GET)
    public String showRefill(ModelMap model) {
        Refuel refuel = new Refuel();
        model.addAttribute("refuel", refuel);
        return "refill";
    }
	
	@RequestMapping(value = { "/refill" }, method = RequestMethod.POST)
    public String newRefill(@Valid @ModelAttribute("refuel") Refuel refuel, BindingResult result, ModelMap model) {
		
		this.service.saveRefuel(refuel);
		
		model.addAttribute("date", refuel.getDate());
		model.addAttribute("fuelstation", refuel.getFuelstation());
		
        return "success";
    }
	
}
