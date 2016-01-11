package pl.mgrz.licznik.model;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
 
@Entity
@Table(name = "role")
public class Role{
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "role_id", 
		unique = true, nullable = false)
	private int roleId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "username", nullable = false)
	private User user;
	
	@Column(name = "role", nullable = false)
	private String role;
 
	public Role() {
	}
 
	public Role(User user, String role) {
		this.user = user;
		this.role = role;
	}
 
	public int getRoleId() {
		return this.roleId;
	}
 
	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}
 
	public User getUser() {
		return this.user;
	}
 
	public void setUser(User user) {
		this.user = user;
	}
	
	public String getRole() {
		return this.role;
	}
 
	public void setRole(String role) {
		this.role = role;
	}
 
}