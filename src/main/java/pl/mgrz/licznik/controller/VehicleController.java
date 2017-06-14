package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import pl.mgrz.licznik.model.AlarmType;
import pl.mgrz.licznik.model.FuelType;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.model.Vehicle;
import pl.mgrz.licznik.service.VehicleService;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

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

    @RequestMapping(value = "/dashboard", method = RequestMethod.GET)
    public String viewVehiclesList(Model model) {
        User user = (User) session.getAttribute("user");
        Vehicle vehicle = vehicleService.getVehiclesByUser(user.getId());
        if (vehicle == null) {
            return "redirect:/vehicle/add";
        }
        model.addAttribute("vehicleList", vehicleService.getVehiclesList(user.getId()));
        return "vehicleDashboard";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public String addVehicle(Model model) {
        List<FuelType> fuelTypeList = Arrays.asList(FuelType.values());

        model.addAttribute("afterpost", false);
        model.addAttribute("fuelTypeList", fuelTypeList);

        return "addVehicle";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String addVehiclePost(Model model, @ModelAttribute("vehicle") Vehicle v,
                                 @RequestParam("fueltype") String fueltype,
                                 @RequestParam("productionDate") String productionDate,
                                 @RequestParam("firstRegistrationDate") String firstRegistrationDate) {
        v.setFuelType(FuelType.valueOf(fueltype));

        model.addAttribute("alarmtype", AlarmType.SUCCESS);
        model.addAttribute("message", "Vehicle successfully added.");
        model.addAttribute("afterpost", true);

        User user = (User) session.getAttribute("user");
        vehicleService.addVehicle(v, user);

        return "addVehicle";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String editVehicle(Model model) {
        List<FuelType> fuelTypeList = Arrays.asList(FuelType.values());
        User user = (User) session.getAttribute("user");
        Vehicle vehicle = vehicleService.getVehiclesByUser(user.getId());

        model.addAttribute("vehicle", vehicle);
        model.addAttribute("afterpost", false);
        model.addAttribute("fuelTypeList", fuelTypeList);

        System.out.println("=====GET======");
        System.out.println(vehicle.toString());
        List<Vehicle> cars = vehicleService.getVehiclesList(user.getId());
        model.addAttribute("vehicleList");
        if(cars.size() > 1){
            return "vehicleList";
        }
        return "editVehicle";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String editVehiclePost(Model model, @ModelAttribute("vehicle") Vehicle v,
                                  @RequestParam("fueltype") String fueltype,
                                  @RequestParam("productionDate") String productionDate,
                                  @RequestParam("firstRegistrationDate") String firstRegistrationDate) {
        List<FuelType> fuelTypeList = Arrays.asList(FuelType.values());
        v.setFuelType(FuelType.valueOf(fueltype));

        model.addAttribute("alarmtype", AlarmType.SUCCESS);
        model.addAttribute("message", "Vehicle successfully edited.");
        model.addAttribute("afterpost", true);
        model.addAttribute("fuelTypeList", fuelTypeList);

        System.out.println("=====POST======");
        System.out.println(v.toString());

        User user = (User) session.getAttribute("user");
        vehicleService.editVehicle(v, user);

        return "editVehicle";
    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String viewProfil(@PathVariable int id, HttpSession session, Model model) {

        vehicleService.removeVehicle(id);

        return "redirect:/vehicles";
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

}
