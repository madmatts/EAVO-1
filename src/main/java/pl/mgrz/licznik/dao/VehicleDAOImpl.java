package pl.mgrz.licznik.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.mgrz.licznik.model.portal.Refuel;
import pl.mgrz.licznik.model.portal.User;
import pl.mgrz.licznik.model.portal.Vehicle;
import pl.mgrz.licznik.service.UserService;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

@Repository
public class VehicleDAOImpl implements VehicleDAO {

    @Autowired
    HttpSession session;

    @Autowired
    private UserService userService;

    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public List<Vehicle> getVehiclesList(int userId) {
        List<Vehicle> vehicleList;
        Query query = getCurrentSession().createQuery("from Vehicle");
        vehicleList = query.list();

        return vehicleList;
    }

    public List<Vehicle> getVehiclesByUser(int userId) {
        Query query = getCurrentSession().createQuery("SELECT v from User u INNER JOIN u.vehicles v WHERE u.id=:id");
        query.setParameter("id", userId);

        return query.list();
    }



    public Vehicle getVehicle(int id) {
        Vehicle vehicle = new Vehicle();

        System.out.println("====" + id);
        Query query = getCurrentSession().createQuery("from Vehicle where id=:id");
        query.setParameter("id", id);

        if (query.list() != null) {
            vehicle = (Vehicle) query.list().get(0);
        }

        return vehicle;
    }

    public void addVehicle(Vehicle vehicle, User user) {
        vehicle.setUser(user);
        Set<Refuel> refuels = null;
        vehicle.setRefuel(refuels);
        getCurrentSession().save(vehicle);
    }

    public void editVehicle(Vehicle vehicle, User user) {
        System.out.println("=====DAO======");
        vehicle.setUser(user);
        System.out.println(vehicle.toString());
        getCurrentSession().update(vehicle);
    }

    public void removeVehicle(int id) {
        Vehicle vehicle = getVehicle(id);
        getCurrentSession().delete(vehicle);
    }

}