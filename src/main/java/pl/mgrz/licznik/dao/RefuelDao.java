package pl.mgrz.licznik.dao;

import java.util.List;

import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.User;

public interface RefuelDao {

	void saveRefuel(User user, Refuel refuel);

	List<Refuel> findAllRefuels();

	void deleteRefuelById(int id);
	
	List<Refuel> findRefuelsForUser(int id);
}