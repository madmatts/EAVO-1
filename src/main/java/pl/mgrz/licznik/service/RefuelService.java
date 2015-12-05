package pl.mgrz.licznik.service;

import java.util.List;

import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.User;

public interface RefuelService {

	void saveRefuel(User user, Refuel refuel);

	List<Refuel> findAllRefuels();

	void deleteRefuelById(int id);
	
	List<Refuel> findRefuelsForUser(int id);
}