package pl.mgrz.licznik.dao;

import java.util.List;

import pl.mgrz.licznik.model.Refuel;

public interface RefuelDao {
	 
    void saveRefuel(Refuel refuel);
    List<Refuel> findAllRefuels(); 
    void deleteRefuelById(int id);
}