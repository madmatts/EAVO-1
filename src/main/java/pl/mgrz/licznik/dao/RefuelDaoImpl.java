package pl.mgrz.licznik.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.User;

@Repository("refuelDao")
public class RefuelDaoImpl extends AbstractDao implements RefuelDao {

	public void saveRefuel(User user, Refuel refuel) {
		refuel.setUser(user);
		persist(refuel);
	}

	@SuppressWarnings("unchecked")
	public List<Refuel> findAllRefuels() {
		Criteria criteria = getSession().createCriteria(Refuel.class);
        return (List<Refuel>) criteria.list();
	}

	public void deleteRefuelById(int id) {
		Query query = getSession().createSQLQuery("delete from refuel where id = :id");
        query.setInteger("id", id);
        query.executeUpdate();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Refuel> findRefuelsForUser(int id) {
		
		List<Refuel> refuels = new ArrayList<Refuel>();
		
		Query query = getSession().createQuery("from Refuel where user_id=?").setParameter(0, id);
		refuels = query.list();
		
		return refuels;
	}

}
