package pl.mgrz.licznik.service;

import pl.mgrz.licznik.model.portal.Refuel;
import pl.mgrz.licznik.model.portal.Vehicle;

import java.util.List;
import java.util.Map;


public interface RefuelService {

    void addRefuel(Refuel refuel, Vehicle vehicle);
    void removeRefuel(int id);
    List<Refuel> getRefuelList(Vehicle vehicle);
    Refuel getRefuelById(int id);
    Refuel getLastRefuel(Vehicle vehicle);
    Refuel getFirstRefuel(Vehicle vehicle);
    void editRefuel(Refuel refuel);
    Map<String, String> getDistinctFuelStations();
    String getAllAverageConsumption();

}