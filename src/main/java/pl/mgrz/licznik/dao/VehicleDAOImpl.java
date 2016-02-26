package pl.mgrz.licznik.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.model.Vehicle;

import javax.servlet.http.HttpSession;

@Repository
public class VehicleDAOImpl implements VehicleDAO {

    @Autowired
    HttpSession session;
    @Autowired
    private SessionFactory sessionFactory;

    private Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    public Vehicle getVehicle(int id) {
        return (Vehicle) getCurrentSession().load(Vehicle.class, id);
    }

    public void addVehicle(Vehicle vehicle, int id) {
        User user = (User) session.getAttribute("user");
        vehicle.setUser(user);
        getCurrentSession().persist(vehicle);
    }

}