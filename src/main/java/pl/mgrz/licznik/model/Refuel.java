package pl.mgrz.licznik.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "refuel")
public class Refuel {

    @Id
    @GeneratedValue
    private int id;
    private long mileage;
    private long latestMileage;
    @Column(precision = 2)
    private double volume;
    @Column(precision = 2)
    private double price;
    @Column(precision = 2)
    private double consumption;
    private double pricePerLitre;
    private String fuelStation;
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date date;
    @ManyToOne
    @JoinTable(name = "vehicle_refuel",
            joinColumns = {@JoinColumn(name = "refuel_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "vehicle_id", referencedColumnName = "id")}
    )
    private Vehicle vehicle;
    private FuelType fuelType;

    public Refuel() {
        consumption = 0;
    }

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    public FuelType getFuelType() {
        return fuelType;
    }

    public void setFuelType(FuelType fuelType) {
        this.fuelType = fuelType;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public long getMileage() {
        return mileage;
    }

    public void setMileage(long mileage) {
        this.mileage = mileage;
    }

    public double getVolume() {
        return volume;
    }

    public void setVolume(double volume) {
        this.volume = volume;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getFuelStation() {
        return fuelStation;
    }

    public void setFuelStation(String fuelStation) {
        this.fuelStation = fuelStation;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }


    public double getPricePerLitre() {
        return pricePerLitre;
    }

    public void setPricePerLitre(double pricePerLitre) {
        this.pricePerLitre = pricePerLitre;
    }


    public long getLatestMileage() {
        return latestMileage;
    }

    public void setLatestMileage(long latestMileage) {
        this.latestMileage = latestMileage;
    }

    public double getConsumption() {
        return consumption;
    }

    public void setConsumption(double consumption) {
        this.consumption = consumption;
    }

    @Override
    public String toString() {
        return "Refuel{" +
                "id=" + id +
                ", mileage=" + mileage +
                ", volume=" + volume +
                ", price=" + price +
                ", consumption=" + consumption +
                ", fuelStation='" + fuelStation + '\'' +
                ", date=" + date +
                ", vehicle=" + vehicle +
                ", fuelType=" + fuelType +
                '}';
    }
}
