package pl.mgrz.licznik.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "vehicle")
public class Vehicle {
    @Id
    @GeneratedValue
    private int id;

    private String brand;

    private String model;

    private String engine;

    private String vin;

    private FuelType fuelType;

    //TODO
    /* Date is to fix */

    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @Temporal(TemporalType.DATE)
    private Date productionDate;

    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @Temporal(TemporalType.DATE)
    private Date firstRegistrationDate;

    private String registrationNumber;

    @ManyToOne(cascade = CascadeType.PERSIST)
    @JoinTable(name = "user_vehicles",
            joinColumns = {@JoinColumn(name = "vehicle_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "user_id", referencedColumnName = "id")}
    )
    private User user;

    @OneToMany(cascade = CascadeType.PERSIST, fetch = FetchType.LAZY)
    @JoinTable(name = "vehicle_refill",
            joinColumns = {@JoinColumn(name = "vehicle_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "refill_id", referencedColumnName = "id")}
    )
    private Set<Refill> refill;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public Date getFirstRegistrationDate() {
        return firstRegistrationDate;
    }

    public void setFirstRegistrationDate(Date firstRegistrationDate) {
        this.firstRegistrationDate = firstRegistrationDate;
    }

    public String getRegistrationNumber() {
        return registrationNumber;
    }

    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    public FuelType getFuelType() {
        return fuelType;
    }

    public void setFuelType(FuelType fuelType) {
        this.fuelType = fuelType;
    }

    public Date getProductionDate() {
        return productionDate;
    }

    public void setProductionDate(Date productionDate) {
        this.productionDate = productionDate;
    }

    public String getVin() {
        return vin;
    }

    public void setVin(String vin) {
        this.vin = vin;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<Refill> getRefill() {
        return refill;
    }

    public void setRefill(Set<Refill> refill) {
        this.refill = refill;
    }

    @Override
    public String toString() {
        return "Vehicle{" +
                "id=" + id +
                ", brand='" + brand + '\'' +
                ", model='" + model + '\'' +
                ", engine='" + engine + '\'' +
                ", vin='" + vin + '\'' +
                ", fuelType=" + fuelType +
                ", productionDate=" + productionDate +
                ", firstRegistrationDate=" + firstRegistrationDate +
                ", registrationNumber='" + registrationNumber + '\'' +
//                ", user=" + user +
//                ", refill=" + refill +
                '}';
    }
}
