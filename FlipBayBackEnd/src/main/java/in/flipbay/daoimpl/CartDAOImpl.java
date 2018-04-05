package in.flipbay.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.flipbay.dao.CartDAO;
import in.flipbay.domain.Cart;

@Repository("cartDAO")
@Transactional
public class CartDAOImpl implements CartDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private Cart cart;

	public CartDAOImpl(SessionFactory sessionFactory) {

		this.sessionFactory = sessionFactory;

	}

	public CartDAOImpl() {

	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public boolean saveOrUpdate(Cart cart) {

		try {
			getSession().saveOrUpdate(cart);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public Cart get(int id) {

		return getSession().get(Cart.class, id);

	}

	public boolean delete(int id) {
		try {
			cart = get(id);
			if (cart == null) {
				return false;
			}
			getSession().delete(cart);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@SuppressWarnings({ "unchecked", "deprecation" })
	public List<Cart> list(String emailID) {
		return getSession().createCriteria(Cart.class).add(Restrictions.eq("emailID", emailID)).list();
	}

}
