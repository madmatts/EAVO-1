package pl.mgrz.licznik.dao;

import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.model.Vehicle;

import java.util.List;

public interface VehicleDAO {

    List<Vehicle> getVehiclesList(int userId);
    List<Vehicle> getVehiclesByUser(int userid);
    Vehicle getVehicle(int id);
    void addVehicle(Vehicle vehicle, User user);
    void removeVehicle(int id);
    void editVehicle(Vehicle vehicle, User user);

}