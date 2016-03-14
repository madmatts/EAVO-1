package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.model.Vehicle;
import pl.mgrz.licznik.service.VehicleService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/vehicle")

public class VehicleController {

    @Autowired
    private HttpSession session;
    @Autowired
    private VehicleService vehicleService;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String viewVehicle(@PathVariable int id, Model model) {
        Vehicle vehicle = vehicleService.getVehicle(id);
        model.addAttribute("vehicle", vehicle);
        return "vehicleViewer";
    }

    @RequestMapping(value = "/vehicles", method = RequestMethod.GET)
    public String viewVehiclesList(Model model) {
        model.addAttribute("vehiclesList", vehicleService.getVehiclesList());

        return "vehiclesList";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addVehicle(@ModelAttribute("vehicleForm") Vehicle v) {

        return "addVehicle";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addVehiclePost(@ModelAttribute("vehicleForm") Vehicle v) {

        User user = (User) session.getAttribute("user");
        vehicleService.addVehicle(v, user.getId());

        return "vehicleViewer";
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String viewProfil(@PathVariable int id, HttpSession session, Model model) {

        vehicleService.removeVehicle(id);

        return "redirect:/vehicles";
    }

}
