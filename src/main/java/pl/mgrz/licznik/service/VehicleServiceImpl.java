package pl.mgrz.licznik.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.mgrz.licznik.dao.VehicleDAO;
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

    public List<Vehicle> getVehiclesList() {
        return vehicleDAO.getVehiclesList();
    }

    public void addVehicle(Vehicle vehicle, int id) {
        vehicleDAO.addVehicle(vehicle, id);
    }

    public void removeVehicle(int id) {
        vehicleDAO.removeVehicle(id);
    }

}