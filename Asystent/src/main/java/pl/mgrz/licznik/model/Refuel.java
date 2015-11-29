package pl.mgrz.licznik.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="refuel")
public class Refuel {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
 
	@NotNull
	@Column(name = "amount", nullable = false)
	@Digits(integer=3, fraction=2, message = "empty")
    private double amount;
	
	@NotNull
	@Column(name = "cost", nullable = false)
	@Digits(integer=4, fraction=2, message = "empty")
	private double cost;
	
	@NotNull
    @DateTimeFormat(pattern="dd/MM/yyyy") 
    @Column(name = "date", nullable = false)
    @Type(type="org.jadira.usertype.dateandtime.joda.PersistentLocalDate")
    private LocalDate date;
	
	@Column(name = "fuelstation", nullable = true)
	private String fuelstation;
	
	public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
    
    public double getAmount() {
        return amount;
    }
 
    public void setAmount(double amount) {
        this.amount = amount;
    }
    
    public double getCost() {
		return cost;
	}

	public void setCost(double cost) {
		this.cost = cost;
	}
	
	public LocalDate getDate() {
        return date;
    }
 
    public void setDate(LocalDate date) {
        this.date = date;
    }
	
	public String getFuelstation() {
		return fuelstation;
	}

	public void setFuelstation(String fuelstation) {
		this.fuelstation = fuelstation;
	}
}