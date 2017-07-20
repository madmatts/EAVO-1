package pl.mgrz.licznik.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.mgrz.licznik.model.Refuel;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.model.Vehicle;
import pl.mgrz.licznik.service.VehicleService;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

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


    public void addRefuel(Refuel refuel, Vehicle vehicle) {
        Refuel lastRefuel = getLastRefuel(vehicle);

        refuel.setLatestMileage(lastRefuel.getMileage());
        refuel.setPricePerLitre(refuel.getVolume() / refuel.getPrice());

        lastRefuel.setConsumption(lastRefuel.getVolume() / (((double) refuel.getMileage() - refuel.getLatestMileage()) / 100));
        getCurrentSession().update(lastRefuel);
        getCurrentSession().save(refuel);

    }

    public Refuel getLastRefuel(Vehicle vehicle) {
        Query query = getCurrentSession().createQuery("from Refuel where vehicle_id=:vehicle_id");
        query.setParameter("vehicle_id", vehicle.getId());
        Refuel refuel = new Refuel();
        if (!query.list().isEmpty()) {
            refuel = (Refuel) query.list().get(query.list().size() - 1);
        } else {
            refuel.setConsumption(0);
        }
        return refuel;
    }

    public Refuel getFirstRefuel(Vehicle vehicle) {
        User user = (User) session.getAttribute("user");
//        Vehicle vehicle1 = vehicleService.getVehiclesByUser(user.getId()).get(0);
        Query query = getCurrentSession().createQuery("SELECT r FROM Vehicle v INNER JOIN v.refuel r WHERE v.id=:id");
        query.setParameter("id", vehicle.getId());
        Refuel refuel = (Refuel) query.list().get(0);

        return refuel;
    }

    public void removeRefuel(int id) {
        getCurrentSession().delete(getRefuelById(id));
    }

    public void editRefuel(Refuel refuel) {
        getCurrentSession().update(refuel);
    }

    public List<Refuel> getRefuelList(Vehicle vehicle) {
//        User user = (User) session.getAttribute("user");
//        Vehicle vehicle = vehicleService.getVehiclesByUser(user.getId()).get(0);
        Query query = getCurrentSession().createQuery("SELECT r FROM Vehicle v INNER JOIN v.refuel r WHERE v.id=:id ORDER BY r.mileage DESC");
        query.setParameter("id", vehicle.getId());
        List<Refuel> refuelList = query.list();
        refuelList.remove(getFirstRefuel(vehicle));

        return refuelList;
    }

    public List<Refuel> getAllRefuels() {
        User user = (User) session.getAttribute("user");
        Vehicle vehicle = vehicleService.getVehiclesByUser(user.getId()).get(0);

        Query query = getCurrentSession().createQuery("SELECT r FROM Vehicle v INNER JOIN v.refuel r WHERE v.id=:id ORDER BY r.id DESC");
        query.setParameter("id", vehicle.getId());
        List<Refuel> refuelList = query.list();

        return refuelList;
    }

    public Refuel getRefuelById(int id) {
        Query query = getCurrentSession().createQuery("FROM Refuel WHERE id=:id");
        query.setParameter("id", id);
        Refuel refuel = (Refuel) query.list().get(0);

        return refuel;
    }

    public Map<String, String> getDistinctFuelStations() {
        Query query = getCurrentSession().createQuery("SELECT DISTINCT fuelStation FROM Refuel");
        List<String> refuelList = query.list();
        Map<String, String> mapDistinct = new HashMap<String, String>();
        String fuelStations = "";
        String countString = "";

        for (String fuelStation : refuelList) {
            fuelStations += "\"" + fuelStation + "\"" + ",";

            Query query1 = getCurrentSession().createQuery("SELECT COUNT(fuelStation) FROM Refuel WHERE fuelStation=:fuelstation");
            query1.setParameter("fuelstation", fuelStation);
            countString += String.format("%d", query1.list().get(0)) + ",";
        }

        if (!fuelStations.isEmpty()) {
            fuelStations = fuelStations.substring(0, fuelStations.length() - 1);
        }
        if (!countString.isEmpty()) {
            countString = countString.substring(0, countString.length() - 1);
        }

        mapDistinct.put("fuelStations", fuelStations);
        mapDistinct.put("values", countString);

        return mapDistinct;
    }

    public String getAllAverageConsumption() {
        Query query = getCurrentSession().createQuery("FROM Refuel");
        List<Refuel> refuelList = query.list();
        String averageData = "";
        for (Refuel r : refuelList) {
            averageData += String.format(Locale.ENGLISH, "%.2f", r.getVolume() / (r.getMileage() - r.getLatestMileage()) * 100) + ",";
        }
        if (!averageData.isEmpty()) {
            averageData.substring(0, averageData.length() - 2);
        }

        return averageData;
    }

}