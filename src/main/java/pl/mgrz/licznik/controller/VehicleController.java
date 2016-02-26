package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.model.Vehicle;
import pl.mgrz.licznik.service.VehicleService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/vehicle")

public class VehicleController {

    @Autowired
    HttpSession session;
    @Autowired
    private VehicleService service;

    @RequestMapping(value = "/vehicle/{id}", method = RequestMethod.GET)
    public String viewVehicle(@RequestParam int id) {

        return "vehicleViewer";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addVehicle(@ModelAttribute("vehicleForm") Vehicle v) {

        return "addVehicle";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addVehiclePost(@ModelAttribute("vehicleForm") Vehicle v) {

        User user = (User) session.getAttribute("user");
        service.addVehicle(v, user.getId());

        return "vehicleViewer";
    }

}
