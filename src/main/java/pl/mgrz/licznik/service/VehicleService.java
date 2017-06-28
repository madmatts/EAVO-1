package pl.mgrz.licznik.service;

import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.model.Vehicle;

import java.util.List;


public interface VehicleService {

    Vehicle getVehicle(int id);
    List<Vehicle> getVehiclesList(int userId);
    Vehicle getVehiclesByUser(int id);
    void addVehicle(Vehicle vehicle, User user);
    void removeVehicle(int id);
    void editVehicle(Vehicle vehicle, User user);
}