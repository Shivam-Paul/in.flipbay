package in.flipbay.daoimpl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.flipbay.dao.AddressDAO;
import in.flipbay.domain.Address;
import in.flipbay.domain.CartItem;

@Repository("addressDAO")
@Transactional
public class AddressDAOImpl implements AddressDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public AddressDAOImpl(SessionFactory sessionFactory) {

		this.sessionFactory = sessionFactory;

	}

	public AddressDAOImpl() {

	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public Address get(String emailID) {

		return getSession().get(Address.class, emailID);
	}

	public boolean save(Address address) {
		try {
			getSession().save(address);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public boolean update(Address address) {
		try {
			getSession().update(address);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	public boolean delete(Address address) {

		try {
			getSession().delete(address);
			return true;
		} catch (Exception ex) {
			ex.printStackTrace();
			return false;
		}

	}

}
