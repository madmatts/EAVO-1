package pl.mgrz.licznik.service;

import pl.mgrz.licznik.model.Vehicle;


public interface VehicleService {

    Vehicle getVehicle(int id);

    void addVehicle(Vehicle vehicle, int id);

}