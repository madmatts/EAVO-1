package pl.mgrz.licznik.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.mgrz.licznik.dao.IRefuelRepository;
import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.User;

@Service("refuelService")
@Transactional
public class RefuelService implements IRefuel {

	@Autowired
	private IRefuelRepository dao;

	
	public void saveRefuel(User user, Refuel refuel) {
		dao.saveRefuel(user, refuel);
	}

	
	public List<Refuel> findAllRefuels() {
		return dao.findAllRefuels();
	}

	public void deleteRefuelById(int id) {
		dao.deleteRefuelById(id);

	}

	
	public List<Refuel> findRefuelsForUser(int id) {
		return dao.findRefuelsForUser(id);
	}

}
