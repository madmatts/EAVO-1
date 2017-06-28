package pl.mgrz.licznik.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.mgrz.licznik.dao.VehicleDAO;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.model.Vehicle;

import java.util.List;

@Service
@Transactional
public class VehicleServiceImpl implements VehicleService {

    @Autowired
    private VehicleDAO vehicleDAO;

    public Vehicle getVehicle(int id) {
        return vehicleDAO.getVehicle(id);
    }

    public List<Vehicle> getVehiclesList(int userId) {
        return vehicleDAO.getVehiclesList(userId);
    }

    public List<Vehicle> getVehiclesByUser(int id) {
        return vehicleDAO.getVehiclesByUser(id);
    }

    public void addVehicle(Vehicle vehicle, User user) {
        vehicleDAO.addVehicle(vehicle, user);
    }

    public void removeVehicle(int id) {
        vehicleDAO.removeVehicle(id);
    }

    public void editVehicle(Vehicle vehicle, User user) {
        vehicleDAO.editVehicle(vehicle, user);
    }
}