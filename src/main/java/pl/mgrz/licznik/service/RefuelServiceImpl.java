package pl.mgrz.licznik.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.mgrz.licznik.dao.RefuelDAO;
import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.Vehicle;

import java.util.List;
import java.util.Map;

@Service
@Transactional
public class RefuelServiceImpl implements RefuelService {

    @Autowired
    RefuelDAO refuelDAO;

    public Refuel getRefuelById(int id) {
        return refuelDAO.getRefuelById(id);
    }

    public Refuel getFirstRefuel(Vehicle vehicle) {
        return refuelDAO.getFirstRefuel(vehicle);
    }

    public Map<String, String> getDistinctFuelStations() {
        return refuelDAO.getDistinctFuelStations();
    }

    public String getAllAverageConsumption() {
        return refuelDAO.getAllAverageConsumption();
    }

    public void editRefuel(Refuel refuel) {
        refuelDAO.editRefuel(refuel);
    }

    public List<Refuel> getRefuelList(Vehicle vehicle) {
        return refuelDAO.getRefuelList(vehicle);
    }

    public void addRefuel(Refuel refuel, Vehicle vehicle) {
        refuelDAO.addRefuel(refuel, vehicle);
    }

    public void removeRefuel(int id) {
        refuelDAO.removeRefuel(id);
    }

    public Refuel getLastRefuel(Vehicle vehicle) {
        return refuelDAO.getLastRefuel(vehicle);
    }
}