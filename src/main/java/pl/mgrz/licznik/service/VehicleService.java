package pl.mgrz.licznik.service;

import pl.mgrz.licznik.model.Vehicle;

import java.util.List;


public interface VehicleService {

    Vehicle getVehicle(int id);
    List<Vehicle> getVehiclesList();
    List<Vehicle> getVehiclesListByUser(int id);
    void addVehicle(Vehicle vehicle, int id);
    void removeVehicle(int id);
}