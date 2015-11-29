package pl.mgrz.licznik.service;

import java.util.List;

import pl.mgrz.licznik.model.Refuel;

public interface RefuelService {
	 
    void saveRefuel(Refuel refuel);
    List<Refuel> findAllRefuels(); 
    void deleteRefuelById(int id);
}