package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.mgrz.licznik.model.FuelType;
import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.service.RefuelService;

import javax.servlet.http.HttpSession;
import java.util.Arrays;
import java.util.List;

/**
 * Created by MadMattz on 22.02.2016.
 */
@Controller
@RequestMapping(value = "/refuel")

public class ConsumptionController {

    @Autowired
    HttpSession session;
    @Autowired
    private RefuelService refuelService;

    @RequestMapping(value = "/add/{id}", method = RequestMethod.GET)
    public String registerConsumption(@PathVariable int id, Model model, @ModelAttribute("refillForm") Refuel r) {
        model.addAttribute("id", id);
        return "registerConsumption";
    }

    @RequestMapping(value = "/add/{id}", method = RequestMethod.POST)
    public String postConsumption(@ModelAttribute("refillForm") Refuel r, @PathVariable int id) {
        System.out.println("======== REFILL =========");
        System.out.println(r.print());
        refuelService.addRefuel(r,r.getId());

        return "redirect:/vehicle/vehicles";
    }

    @RequestMapping(value = "/refuel", method = RequestMethod.GET)
    public String refuelDashboard(Model model) {
        List<FuelType> fuelTypeList = Arrays.asList(FuelType.values());
        model.addAttribute("fuelTypeList", fuelTypeList);

        return "refuelDashboard";
    }

}
