package pl.mgrz.licznik.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.mgrz.licznik.dao.VehicleDAO;
import pl.mgrz.licznik.model.Vehicle;

@Service
@Transactional
public class VehicleServiceImpl implements VehicleService {

    @Autowired
    private VehicleDAO vehicleDAO;

    public Vehicle getVehicle(int id) {
        return vehicleDAO.getVehicle(id);
    }

    public void addVehicle(Vehicle vehicle, int id) {
        vehicleDAO.addVehicle(vehicle, id);
    }

}