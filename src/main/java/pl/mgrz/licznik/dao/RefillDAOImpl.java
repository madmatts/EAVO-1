package pl.mgrz.licznik.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.mgrz.licznik.model.Refill;
import pl.mgrz.licznik.model.Vehicle;
import pl.mgrz.licznik.service.VehicleService;

import javax.servlet.http.HttpSession;

@Repository
public class RefillDAOImpl implements RefillDAO {

    @Autowired
    HttpSession session;

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }


    public void addRefill(Refill refill, int id) {
        Vehicle v = vehicleService.getVehicle(id);
        refill.setVehicle(v);
        getCurrentSession().persist(refill);
    }

    public void addRefill(int id) {

    }

    public void removeRefill(int id) {
        getCurrentSession().delete(getRefillById(id));
    }

    public Refill getRefillById(int id) {
        Query query = getCurrentSession().createQuery("from Refill where id=:id");
        query.setParameter("id", id);
        Refill refill = (Refill) query.list().get(0);

        return getRefillById(id);
    }
}