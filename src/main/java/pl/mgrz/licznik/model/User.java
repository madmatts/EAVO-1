package pl.mgrz.licznik.model;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "user")
public class User {

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Size(min = 2, max = 30, message = "Username powinien zawieraæ od 2 do 30 znaków!")
	private String username;

	@Size(min = 6, max = 20, message = "Has³o powinno zawieraæ od 6 do 20 znaków!")
	private String password;

	@NotEmpty(message = "Pole Email jest wymagane")
	@Email(message = "To nie jest prawid³owy adres email!")
	private String email;

	@NotEmpty(message = "Pole Samochód jest wymagane")
	@Column(name = "car", nullable = true)
	private String car;

	@ManyToMany
	@JoinTable(name = "role", joinColumns = @JoinColumn(name = "username", referencedColumnName = "username") )
	private Collection<Role> roles;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user", cascade = CascadeType.REMOVE)
	private Set<Refuel> refuel = new HashSet<Refuel>(0);

	private boolean enabled;
	private boolean tokenExpired;

	public Set<Refuel> getRefuel() {
		return refuel;
	}

	public void setRefuel(Set<Refuel> refuel) {
		this.refuel = refuel;
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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
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

	public Collection<Role> getRoles() {
		return roles;
	}

	public void setRoles(Collection<Role> roles) {
		this.roles = roles;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public boolean isTokenExpired() {
		return tokenExpired;
	}

	public void setTokenExpired(boolean tokenExpired) {
		this.tokenExpired = tokenExpired;
	}

}
