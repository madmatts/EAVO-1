package pl.mgrz.licznik.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import pl.mgrz.licznik.dao.RefuelDao;
import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.User;

@Service("refuelService")
@Transactional
public class RefuelServiceImpl implements RefuelService {

	@Autowired
	private RefuelDao dao;

	@Override
	public void saveRefuel(User user, Refuel refuel) {
		dao.saveRefuel(user, refuel);
	}

	@Override
	public List<Refuel> findAllRefuels() {
		return dao.findAllRefuels();
	}

	@Override
	public void deleteRefuelById(int id) {
		dao.deleteRefuelById(id);

	}

	@Override
	public List<Refuel> findRefuelsForUser(int id) {
		return dao.findRefuelsForUser(id);
	}

}
