package in.flipbay.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.flipbay.dao.CartItemDAO;
import in.flipbay.domain.Cart;
import in.flipbay.domain.CartItem;

@Repository("cartItemDAO")
@Transactional
public class CartItemDAOImpl implements CartItemDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public CartItemDAOImpl(SessionFactory sessionFactory) {

		this.sessionFactory = sessionFactory;

	}

	public CartItemDAOImpl() {

	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	

	public CartItem get(int cartItemID) {
		
		return getSession().get(CartItem.class, cartItemID);
	}

	public boolean addCartItem(CartItem cartItem) {
		try {
			getSession().save(cartItem);
			return true;
			}
			catch(Exception ex) {
			ex.printStackTrace();
			return false;
			}
	}

	public boolean updateCartItem(CartItem cartItem) {
		try {
			getSession().update(cartItem);
			return true;
			}
			catch(Exception ex) {
			ex.printStackTrace();
			return false;
			}
	}

	public boolean deleteCartItem(CartItem cartItem) {
		try {
			getSession().delete(cartItem);
			return true;
			}
			catch(Exception ex) {
			ex.printStackTrace();
			return false;
			}
	}

	public List<CartItem> list(int cartID) {
		String query = "FROM CartItem WHERE cartId = :cartID";
		return getSession()
		.createQuery(query, CartItem.class)
		.setParameter("cartID", cartID)
		.getResultList();
	}

	public CartItem getByCartAndProduct(int cartID, int productID) {
		String query = "FROM CartItem WHERE cartID = :cartID AND productID = :productID";
		try {
		return getSession()
		.createQuery(query,CartItem.class)
		.setParameter("cartID", cartID)
		.setParameter("productID", productID)
		.getSingleResult();
		
		}
		catch(Exception ex) {
		return null;	
		}
	}

	public boolean update(Cart cart) {
		try{
			getSession().update(cart);
			return true;
			}
			catch(Exception ex){
			ex.printStackTrace();
			return false;
			}
	}

	public Cart getCart(String emailID) {
		String query = "FROM Cart WHERE emailID = :emailID";
		return getSession()
		.createQuery(query, Cart.class)
		.setParameter("emailID", emailID)
		.getSingleResult();
	}

	public boolean addCart(Cart cart) {
		
		try {
			
			getSession().save(cart);
			

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	
	}

}
