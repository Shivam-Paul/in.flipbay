package in.flipbay.daoimpl;

import java.sql.Date;
import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.flipbay.domain.User;
import in.flipbay.dao.UserDAO;

@Repository("userDAO")
@Transactional
public class UserDAOImpl implements UserDAO {
	
	Logger log = LoggerFactory.getLogger(UserDAOImpl.class);

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
		
		log.debug("Starting of the method save in UserDAOImpl");
		
		try {
			user.setRole('C');
			user.setRegisteredDate(new Date(System.currentTimeMillis()));
			getSession().save(user);
			
			log.debug("Ending of the method save in UserDAOImpl");

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean update(User user) {
		
		log.debug("Starting of the method update in UserDAOImpl");

		try {
			getSession().update(user);
			
			log.debug("Ending of the method update in UserDAOImpl");

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public User get(String emailID) {
		
		log.debug("get method called in UserDAOImpl");

			return getSession().get(User.class, emailID);
	
	}
	
	public boolean delete(String emailID) {
		
		log.debug("Starting of the method delete in UserDAOImpl");

		
		try {
			user = get(emailID);
			if(user==null) {
				
				log.debug("No user found with emailID= "+emailID+" to delete");

				return false;
			}
			
			getSession().delete(user);
			
			log.debug("Ending of the method delete in UserDAOImpl");

			return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
	
	@SuppressWarnings("unchecked")
	public List<User> list() {
		
		log.debug("list method called in UserDAOImpl");

		return getSession().createQuery("from User").list();
	}

	@SuppressWarnings("deprecation")
	public User validate(String emailID, String password) {
		
		log.debug("validate method called in UserDAOImpl");

		return (User)getSession().createCriteria(User.class).add(Restrictions.eq("emailID",emailID)).
				add(Restrictions.eq("pwd", password)).uniqueResult();
		
	}

}








