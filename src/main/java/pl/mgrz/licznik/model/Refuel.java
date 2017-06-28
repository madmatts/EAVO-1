package pl.mgrz.licznik.model;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "Refuel")
public class Refuel {

    public Refuel(){
        pricePerLitre = 0;
        mileage = 0;
        
    }
    @Id
    @GeneratedValue
    private int id;

    private long mileage;

    private double volume;

    private double price;

    private double pricePerLitre;

    private String fuelStation;

    //    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date date;

    @ManyToOne(cascade = CascadeType.ALL)
    @JoinTable(name = "vehicle_Refuel",
            joinColumns = {@JoinColumn(name = "Refuel_id", referencedColumnName = "id")},
            inverseJoinColumns = {@JoinColumn(name = "vehicle_id", referencedColumnName = "id")}
    )
    private Vehicle vehicle;

    private String type;

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public double getPricePerLitre() {
        return pricePerLitre;
    }

    public void setPricePerLitre(double pricePerLitre) {
        this.pricePerLitre = pricePerLitre;
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

    public String print() {
        return "Refuel: [" + getId() + ", " + getMileage() + ", " + getVolume() + ", " + getType() + ", " + getDate() + ", " + getFuelStation() + ", " + getPrice() + ", " + getPricePerLitre() + ", " +            getVehicle() + "]";
    }
}
