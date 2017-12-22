package pl.mgrz.licznik.service;

import pl.mgrz.licznik.model.portal.User;
import pl.mgrz.licznik.model.portal.Vehicle;

import java.util.List;


public interface VehicleService {

    Vehicle getVehicle(int id);
    List<Vehicle> getVehiclesList(int userId);
    List<Vehicle> getVehiclesByUser(int id);
    void addVehicle(Vehicle vehicle, User user);
    void removeVehicle(int id);
    void editVehicle(Vehicle vehicle, User user);
}