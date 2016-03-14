package pl.mgrz.licznik.dao;

import pl.mgrz.licznik.model.Vehicle;

import java.util.List;

public interface VehicleDAO {

    List<Vehicle> getVehiclesList();
    Vehicle getVehicle(int id);
    void addVehicle(Vehicle vehicle, int id);
    void removeVehicle(int id);

}