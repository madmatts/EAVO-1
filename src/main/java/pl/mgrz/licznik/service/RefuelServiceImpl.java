package pl.mgrz.licznik.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import pl.mgrz.licznik.dao.RefuelDAO;
import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.Vehicle;

import java.util.List;

@Service
@Transactional
public class RefuelServiceImpl implements RefuelService {

    @Autowired
    RefuelDAO refuelDAO;

    public Refuel getRefuel(int id) {
        return refuelDAO.getRefuelById(id);
    }

    public List<Refuel> getRefuelList(Vehicle vehicle) {
        return refuelDAO.getRefuelList(vehicle);
    }

    public void addRefuel(Refuel refuel, int id) {
        refuelDAO.addRefuel(refuel, id);
    }

    public void removeRefuel(int id) {
        refuelDAO.removeRefuel(id);
    }

    public Refuel getLastRefuel(int id) {
        return refuelDAO.getLastRefuel(id);
    }
}