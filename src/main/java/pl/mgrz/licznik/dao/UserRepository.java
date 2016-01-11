package pl.mgrz.licznik.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import pl.mgrz.licznik.exception.EmailTakenException;
import pl.mgrz.licznik.exception.UserAlreadyExistsException;
import pl.mgrz.licznik.model.Role;
import pl.mgrz.licznik.model.User;

@Repository
public class UserRepository extends AbstractRepository implements IUserRepository {

	public void addUser(User u) throws UserAlreadyExistsException, EmailTakenException {
		Session session = getSession();
		boolean userExists = session.createQuery("FROM User WHERE username = :username")
				.setParameter("username", u.getUsername()).list().size() > 0;
		boolean emailTaken = session.createQuery("FROM User WHERE email = :email").setParameter("email", u.getEmail())
				.list().size() > 0;
		if (userExists)
			throw new UserAlreadyExistsException("UserAlreadyExist");
		if (emailTaken)
			throw new EmailTakenException("EmailTakenException");
		session.persist(u);
		Role ur = new Role(u, "ROLE_USER");
		session.persist(ur);
	}

	@SuppressWarnings("unchecked")
	public User findByUserName(String username) {

		List<User> users = new ArrayList<User>();

		users = getSession().createQuery("from User where username=?").setParameter(0, username).list();

		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}

	}

	@SuppressWarnings("unchecked")
	public List<User> listUsers() {
		Session session = getSession();
		List<User> usersList = session.createQuery("from User").list();
		return usersList;
	}

	public void removeUser(int id) {
		Session session = getSession();

		Query query = session.createQuery("from User where id=?").setParameter(0, id);
		query.list().get(0);

		User u = (User) query.list().get(0);

		query = session.createQuery("from Roles where user_id=?").setParameter(0, id);
		@SuppressWarnings("unchecked")
		List<Role> roles = query.list();

		for (Role ur : roles) {
			session.delete(ur);
		}

		if (null != u) {
			session.delete(u);
		}

	}

	public User getUserById(int id) {
		Session session = getSession();

		Query query = session.createQuery("from User where id=?").setParameter(0, id);
		query.list().get(0);

		User u = (User) query.list().get(0);

		return u;
	}

	public void updateUser(User u) {
		Session session = getSession();
		Query query = session.createQuery("from User where username=?").setParameter(0, u.getUsername());
		User user = (User) query.list().get(0);

		user.setEmail(u.getEmail());
		user.setUsername(u.getUsername());
		user.setCar(u.getCar());
		session.update(user);
	}

	private static int pageSize = 3;

	@SuppressWarnings("unchecked")
	public List<User> getData(int pageNumber) {
		Session session = getSession();

		List<User> result = null;

		Query query = session.createQuery("from User");
		query.setFirstResult(pageSize * (pageNumber - 1));
		query.setMaxResults(pageSize);
		result = query.list();

		return result;
	}

	@SuppressWarnings("unchecked")
	public boolean checkIfAdmin(int id) {
		Session session = getSession();

		List<Role> result = new ArrayList<Role>();
		List<String> roles = new ArrayList<String>();

		Query query = session.createQuery("from Roles where user_id=?").setParameter(0, id);
		result = query.list();

		for (Role ur : result) {
			roles.add(ur.getRole());
		}

		return roles.contains("ROLE_ADMIN");
	}

	@SuppressWarnings("unchecked")
	public List<User> searchUsers(String username) {

		username = "%" + username + "%";

		Query query = getSession().createQuery("from user where username like ?").setParameter(0, username);
		List<User> result = query.list();

		return result;
	}

	@SuppressWarnings("unchecked")
	public User findByEmail(String email) {
		List<User> users = new ArrayList<User>();

		users = getSession().createQuery("from user where email=?").setParameter(0, email).list();

		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}
	}
}
