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
@Table(name = "userroles", 
	uniqueConstraints = @UniqueConstraint(
		columnNames ={"user_role", "user_id" } ))
public class UserRole{
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "user_role_id", 
		unique = true, nullable = false)
	private int userRoleId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	private User user;
	
	@Column(name = "user_role", nullable = false)
	private String role;
 
	public UserRole() {
	}
 
	public UserRole(User user, String role) {
		this.user = user;
		this.role = role;
	}
 
	public int getUserRoleId() {
		return this.userRoleId;
	}
 
	public void setUserRoleId(int userRoleId) {
		this.userRoleId = userRoleId;
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