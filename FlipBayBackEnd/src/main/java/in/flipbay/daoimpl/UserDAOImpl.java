package in.flipbay.daoimpl;

import java.sql.Date;
import java.util.List;

import javax.sql.DataSource;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import in.flipbay.domain.User;
import in.flipbay.dao.UserDAO;

@Repository("userDAO")
@Transactional
public class UserDAOImpl implements UserDAO {
	
	

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private User user;
	
	
	
	
	public UserDAOImpl(SessionFactory sessionFactory)
	{
		this.sessionFactory = sessionFactory;
	}
	
	public UserDAOImpl()
	{
		
	}
	

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public boolean save(User user) {
		try {
			user.setRole('C');
			user.setRegisteredDate(new Date(System.currentTimeMillis()));
			getSession().save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean update(User user) {
		try {
			getSession().update(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public User get(String emailID) {

			return getSession().get(User.class, emailID);
	
	}
	
	public boolean delete(String emailID) {
		
		try {
			user = get(emailID);
			if(user==null) {
				return false;
			}
			
			getSession().delete(user);
			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<User> list() {
		return getSession().createQuery("from User").list();
	}

	@SuppressWarnings("deprecation")
	public User validate(String emailID, String password) {
		// select * from user where id ='niit' and password ='niit'
		return (User)getSession().createCriteria(User.class).add(Restrictions.eq("emailID",emailID)).
				add(Restrictions.eq("pwd", password)).uniqueResult();
		
	}
	
	

	public boolean register(User user) {
		
		try {
			getSession().save(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

}








