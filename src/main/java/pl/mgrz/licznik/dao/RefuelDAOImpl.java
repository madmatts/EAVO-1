package pl.mgrz.licznik.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.Vehicle;
import pl.mgrz.licznik.service.VehicleService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

@Repository
public class RefuelDAOImpl implements RefuelDAO {

    @Autowired
    HttpSession session;

    @Autowired
    private VehicleService vehicleService;

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }


    public void addRefuel(Refuel refuel, int id) {
        Vehicle v = vehicleService.getVehicle(id);
        refuel.setVehicle(v);
        refuel.setDate(new Date());
        getCurrentSession().persist(refuel);
    }

    public void addRefuel(int id) {

    }

    public void removeRefuel(int id) {
        getCurrentSession().delete(getRefuelById(id));
    }

    public Refuel getRefuelById(int id) {
        Query query = getCurrentSession().createQuery("from Refuel where id=:id");
        query.setParameter("id", id);
        Refuel refuel = (Refuel) query.list().get(0);

        return refuel;
    }

    public Refuel getLastRefuel(int id) {
        Query query = getCurrentSession().createQuery("from Refuel where id=:id");
        query.setParameter("id", id);
        Refuel refuel = new Refuel();
        if(!query.list().isEmpty()) {
            refuel = (Refuel) query.list().get(query.list().size() - 1);
        } else{
            refuel.setPricePerLitre(0);
        }
        return refuel;
    }

    public List<Refuel> getRefuelList(Vehicle vehicle) {
        Query query = getCurrentSession().createQuery("SELECT r from Vehicle v INNER JOIN v.refuel r WHERE v.id=:id");
        query.setParameter("id", vehicle.getId());
        if (!query.list().isEmpty()) {
             return query.list();
        }
        return new LinkedList<Refuel>();
    }
}