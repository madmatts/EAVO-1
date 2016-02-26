package pl.mgrz.licznik.dao;

import pl.mgrz.licznik.model.Vehicle;

public interface VehicleDAO {

    Vehicle getVehicle(int id);

    void addVehicle(Vehicle vehicle, int id);

}