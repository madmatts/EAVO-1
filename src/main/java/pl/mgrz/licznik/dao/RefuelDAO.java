package pl.mgrz.licznik.dao;

import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.Vehicle;

import java.util.List;

public interface RefuelDAO {

    void addRefuel(Refuel refuel, int id);
    void removeRefuel(int id);
    Refuel getRefuelById(int id);
    Refuel getLastRefuel(int id);
    List<Refuel> getRefuelList(Vehicle vehicle);
}