package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pl.mgrz.licznik.model.AlarmType;
import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.model.Vehicle;
import pl.mgrz.licznik.service.RefuelService;
import pl.mgrz.licznik.service.VehicleService;

import javax.servlet.http.HttpSession;

/**
 * Created by MadMattz on 22.02.2016.
 */
@Controller
@RequestMapping(value = "/vehicle/refuel")

public class ConsumptionController {

    @Autowired
    HttpSession session;
    @Autowired
    private RefuelService refuelService;
    @Autowired
    private VehicleService vehicleService;

    private Refuel firstRefuel;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String registerConsumption(Model model, @PathVariable("id") int vehicleId) {
        Vehicle vehicle = vehicleService.getVehicle(vehicleId);

        System.out.println("=======FUELST======");
        System.out.println(refuelService.getDistinctFuelStations().get("fuelStations"));
        System.out.println("=======VALUES======");
        System.out.println(refuelService.getDistinctFuelStations().get("values"));

        firstRefuel = refuelService.getFirstRefuel(vehicle);
        model.addAttribute("first", firstRefuel);
        model.addAttribute("refuelList", refuelService.getRefuelList(vehicle));
        model.addAttribute("averageConsumption", refuelService.getAllAverageConsumption());
        model.addAttribute("fuelStations", refuelService.getDistinctFuelStations().get("fuelStations"));
        model.addAttribute("fuelStationCounts", refuelService.getDistinctFuelStations().get("values"));
        model.addAttribute("actionPath", "/vehicle/refuel/add");

        return "refuel";
    }

    @RequestMapping(value = "/add/{id}", method = RequestMethod.POST)
    public String postConsumption(@ModelAttribute("refuel") Refuel r, Model model, @PathVariable("id") int vehicleId) {
        Vehicle vehicle = vehicleService.getVehicle(vehicleId);
        r.setFuelType(vehicle.getFuelType());
//        r.setPricePerLitre(r.getPrice()/r.getVolume());
        r.setVehicle(vehicle);

        model.addAttribute("alarmtype", AlarmType.SUCCESS);
        model.addAttribute("vehicle", vehicle);
        model.addAttribute("afterpost", true);
        model.addAttribute("message", "Refuel successfully added.");
        model.addAttribute("first", firstRefuel);
        model.addAttribute("refuelList", refuelService.getRefuelList(vehicle));
        model.addAttribute("actionPath", "/vehicle/refuel/add");

        refuelService.addRefuel(r,vehicle);

        return "redirect:/vehicle/refuel/";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String edit(@PathVariable(value = "id")int id, Model model) {
        Refuel refuel = refuelService.getRefuelById(id);
        model.addAttribute("alarmtype", AlarmType.INFO);
        model.addAttribute("afterpost", true);
        model.addAttribute("message", "Edit selected refuel.");
        model.addAttribute("refuel", refuel);
        model.addAttribute("refuelList", refuelService.getRefuelList(refuel.getVehicle()));
        model.addAttribute("first", firstRefuel);
        model.addAttribute("actionPath", "/vehicle/refuel/edit/"+id);

        return "refuel";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.POST)
    public String postEdit(@ModelAttribute("refuel") Refuel r, Model model, @PathVariable("id") int vehicleId) {
        User user = (User) session.getAttribute("user");
        Vehicle vehicle = vehicleService.getVehicle(vehicleId);
        r.setFuelType(vehicle.getFuelType());

        r.setVehicle(vehicle);

        System.out.println("===POST===");
        System.out.println(r.toString());

        refuelService.editRefuel(r);

        model.addAttribute("alarmtype", AlarmType.SUCCESS);
        model.addAttribute("afterpost", true);
        model.addAttribute("message", "Refuel edited successfully.");
        model.addAttribute("refuelList", refuelService.getRefuelList(vehicle));
        model.addAttribute("first", firstRefuel);
        model.addAttribute("actionPath", "/vehicle/refuel/add");



        return "refuel";
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String remove(@PathVariable(value = "id")int id, Model model) {
        User user = (User) session.getAttribute("user");
        Vehicle vehicle = refuelService.getRefuelById(id).getVehicle();
        refuelService.removeRefuel(id);

        model.addAttribute("alarmtype", AlarmType.SUCCESS);
        model.addAttribute("afterpost", true);
        model.addAttribute("message", "Refuel removed successfully.");
        model.addAttribute("refuelList", refuelService.getRefuelList(vehicle));
        model.addAttribute("first", firstRefuel);
        model.addAttribute("actionPath", "/vehicle/refuel/add");

        return "refuel";
    }

}
