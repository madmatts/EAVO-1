package pl.mgrz.licznik.dao;

import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.Vehicle;

import java.util.List;
import java.util.Map;

public interface RefuelDAO {

    void addRefuel(Refuel refuel, Vehicle vehicle);
    void removeRefuel(int id);
    List<Refuel> getRefuelList(Vehicle vehicle);
    List<Refuel> getAllRefuels();
    Refuel getRefuelById(int id);
    Refuel getLastRefuel(Vehicle vehicle);
    Refuel getFirstRefuel(Vehicle vehicle);
    void editRefuel(Refuel refuel);

    Map<String, String> getDistinctFuelStations();
    String getAllAverageConsumption();
}