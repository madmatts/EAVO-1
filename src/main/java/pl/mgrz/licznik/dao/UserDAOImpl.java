package pl.mgrz.licznik.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import pl.mgrz.licznik.model.User;
import pl.mgrz.licznik.service.RoleService;

import java.util.ArrayList;
import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Autowired
    private RoleService roleService;

    private Session openSession() {
        return sessionFactory.getCurrentSession();
    }

    public User getUser(String login) {
        List<User> userList = new ArrayList<User>();
        Query query = openSession().createQuery("from User u where u.login = :login");
        query.setParameter("login", login);
        userList = query.list();
        if (userList.size() > 0)
            return userList.get(0);
        else
            return null;
    }

    public List<User> getAllUsers() {
        List<User> userList = new ArrayList<User>();
        Query query = openSession().createQuery("from User");
        userList = query.list();

        return userList;
    }

    public void removeUser(String login) {
//        User user = getUser(login);
//        openSession().delete(user);
    }

    public void registerUser(User user) {
        user.setRole(roleService.getRole(3));
        openSession().persist(user);
    }

}