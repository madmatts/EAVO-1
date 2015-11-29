package pl.mgrz.licznik.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import pl.mgrz.licznik.model.User;


@Repository("userDao")
public class UserDaoImpl extends AbstractDao implements UserDao{
 
	@Autowired
	private SessionFactory sessionFactory;
	
    public void saveUser(User user) throws ConstraintViolationException {
    	persist(user);
    }
 
    @SuppressWarnings("unchecked")
    public List<User> findAllUsers() {
        Criteria criteria = getSession().createCriteria(User.class);
        return (List<User>) criteria.list();
    }
 
    public void deleteUserByName(String name) {
        Query query = getSession().createSQLQuery("delete from user where username = :username");
        query.setString("username", name);
        query.executeUpdate();
    }

    
	@SuppressWarnings("unchecked")
	public User findByUserName(String username) {
 
		List<User> users = new ArrayList<User>();
        
		users = sessionFactory.getCurrentSession()
			.createQuery("from user where username=?")
			.setParameter(0, username)
			.list();
 
		if (users.size() > 0) {
			return users.get(0);
		} else {
			return null;
		}
 
	}
     
}
