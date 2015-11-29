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
import javax.persistence.UniqueConstraint;
 
@Entity
@Table(name = "user_roles", 
	uniqueConstraints = @UniqueConstraint(
		columnNames = { "user_role", "user_username" }))
public class UserRole{
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "user_role_id", 
		unique = true, nullable = false)
	private int userRoleId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_username", nullable = false)
	private User user;
	
	@Column(name = "user_role", nullable = false, length = 45)
	private String user_role;
 
	public UserRole() {
	}
 
	public UserRole(User user, String role) {
		this.user = user;
		this.user_role = role;
	}
 
	public int getUserRoleId() {
		return this.userRoleId;
	}
 
	public void setUserRoleId(Integer userRoleId) {
		this.userRoleId = userRoleId;
	}
 
	public User getUser() {
		return this.user;
	}
 
	public void setUser(User user) {
		this.user = user;
	}
	
	public String getRole() {
		return this.user_role;
	}
 
	public void setRole(String role) {
		this.user_role = role;
	}
 
}