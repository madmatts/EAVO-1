package pl.mgrz.licznik.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import pl.mgrz.licznik.model.Refuel;

@Repository("refuelDao")
public class RefuelDaoImpl extends AbstractDao implements RefuelDao {

	public void saveRefuel(Refuel refuel) {
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

}
