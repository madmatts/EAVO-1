package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.mgrz.licznik.model.Refill;
import pl.mgrz.licznik.service.RefillService;

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
    private RefillService refillService;

    @RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
    public String registerConsumption(@PathVariable int id, Model model) {
        model.addAttribute("id", id);
        return "registerConsumption";
    }

    @RequestMapping(value = "/add/{id}", method = RequestMethod.POST)
    public String postConsumption(@ModelAttribute("refillForm") Refill r, @PathVariable int id) {
        refillService.addRefill(r,id);
        return "redirect:/vehicle/vehicles";
    }

}
