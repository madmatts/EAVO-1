package pl.mgrz.licznik.model;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="user")
public class User {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
 
	@NotNull
    @Size(min=3, max=50, message = "Username powinien zawieraæ od 2 do 30 znaków!")
    private String username;
	
	@Size(min = 6, max = 20, message = "Has³o powinno zawieraæ od 6 do 20 znaków!")
	private String password;
	
	@NotEmpty(message = "Pole Email jest wymagane")
	@Email(message = "To nie jest prawid³owy adres email!")
	@Column(name = "email", nullable = false)
	private String email;
	
	@NotEmpty(message = "Pole Samochód jest wymagane")
	@Column(name = "car", nullable = false)
	private String car;
	
	@Column(name = "enabled", nullable = false)
	private boolean enabled;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private Set<UserRole> userRole = new HashSet<UserRole>(0);
	
	public int getId() {
        return id;
    }
 
    public void setId(int id) {
        this.id = id;
    }
    
    public String getUsername() {
        return username;
    }
 
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getCar() {
		return car;
	}

	public void setCar(String car) {
		this.car = car;
	}
	
	public boolean isEnabled() {
		return this.enabled;
	}
 
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
 
	public Set<UserRole> getUserRole() {
		return this.userRole;
	}
 
	public void setUserRole(Set<UserRole> userRole) {
		this.userRole = userRole;
	}
	
}
