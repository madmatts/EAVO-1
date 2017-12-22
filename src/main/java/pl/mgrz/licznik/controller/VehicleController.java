package pl.mgrz.licznik.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import pl.mgrz.licznik.model.portal.AlarmType;
import pl.mgrz.licznik.model.portal.FuelType;
import pl.mgrz.licznik.model.portal.User;
import pl.mgrz.licznik.model.portal.Vehicle;
import pl.mgrz.licznik.service.RefuelService;
import pl.mgrz.licznik.service.VehicleService;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/vehicle")

public class VehicleController extends AbstractController {

    @Autowired
    private HttpSession session;

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private RefuelService refuelService;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String viewVehicle(@PathVariable("id") int id, Model model) {
        Vehicle vehicle = vehicleService.getVehicle(id);
        model.addAttribute("vehicle", vehicle);
        return "vehicleViewer";
    }

    @RequestMapping(value = "/dashboard/{id}", method = RequestMethod.GET)
    public String viewVehiclesList(Model model, @PathVariable("id") int vehicleId) {
        User user = getLoggedUser();
        List<Vehicle> vehicleList = (List<Vehicle>) vehicleService.getVehiclesByUser(user.getId());
        if (vehicleList.isEmpty()) {
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

        User user = getLoggedUser();
        vehicleService.addVehicle(v, user);

        ((List<Vehicle>) session.getAttribute("vehicleList")).add(v);
        return "redirect:/vehicle/dashboard/" + v.getId();
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String editVehicle(Model model, @PathVariable("id") int vehicleId) {
        List<FuelType> fuelTypeList = Arrays.asList(FuelType.values());
        User user = getLoggedUser();
        Vehicle vehicle = vehicleService.getVehicle(vehicleId);
//        List<Vehicle> vehicleList = vehicleService.getVehiclesByUser(user.getId());

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

//    @RequestMapping(value = "/edit", method = RequestMethod.POST)
//    public String editVehiclePost(Model model, @ModelAttribute("vehicle") Vehicle v,
//                                  @RequestParam("fueltype") String fueltype,
//                                  @RequestParam("productionDate") String productionDate,
//                                  @RequestParam("firstRegistrationDate") String firstRegistrationDate) {
//        List<FuelType> fuelTypeList = Arrays.asList(FuelType.values());
//        v.setFuelType(FuelType.valueOf(fueltype));
//
//        model.addAttribute("alarmtype", AlarmType.SUCCESS);
//        model.addAttribute("message", "Vehicle successfully edited.");
//        model.addAttribute("afterpost", true);
//        model.addAttribute("fuelTypeList", fuelTypeList);
//
//        System.out.println("=====POST======");
//        System.out.println(v.toString());
//
//        User user = getLoggedUser();
//        vehicleService.editVehicle(v, user);
//
//        return "editVehicle";
//    }

    @RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
    public String viewRemove(@PathVariable int id, Model model) {

//        vehicleService.removeVehicle(id);

        return "redirect:/vehicles";
    }

    @RequestMapping(value = "/repair/{id}", method = RequestMethod.GET)
    public String viewRepairs(@PathVariable int id, Model model) {

        return "repairs";
    }


//    @RequestMapping(value = "/refuel/{id}", method = RequestMethod.GET)
//    public String refuelView(Model model, @PathVariable("id") int vehicleId) {
//        List<FuelType> fuelTypeList = Arrays.asList(FuelType.values());
//        Vehicle vehicle = vehicleService.getVehicle(vehicleId);
//        List<Refuel> refuelList = refuelService.getRefuelList(vehicle);
//        model.addAttribute("vehicle", vehicle);
//        model.addAttribute("afterpost", false);
//        model.addAttribute("fuelTypeList", fuelTypeList);
//        System.out.println(refuelList);
//        model.addAttribute("refuelList", refuelList);
//
//        return "refuel";
//    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));
    }

}
