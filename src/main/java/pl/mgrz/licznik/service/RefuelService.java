package pl.mgrz.licznik.service;

import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.Vehicle;

import java.util.List;


public interface RefuelService {

    Refuel getRefuel(int id);
    List<Refuel> getRefuelList(Vehicle vehicle);
    void addRefuel(Refuel refuel, int id);
    void removeRefuel(int id);
    Refuel getLastRefuel(int id);
}