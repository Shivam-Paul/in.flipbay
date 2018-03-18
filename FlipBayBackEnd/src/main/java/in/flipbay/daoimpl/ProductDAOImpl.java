package in.flipbay.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.flipbay.dao.ProductDAO;
import in.flipbay.domain.Product;

@Repository("productDAO")
@Transactional
public class ProductDAOImpl implements ProductDAO{
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private Product product;

public ProductDAOImpl(SessionFactory sessionFactory) {
		
		this.sessionFactory = sessionFactory;
		
}
	public ProductDAOImpl()
	{
		
	}
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public boolean save(Product product) {
		try {
			product.setDescription(product.getName());
			getSession().save(product);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean update(Product product) {
		try {
			getSession().update(product);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public Product get(String id) {
		return getSession().get(Product.class, id);

	}

	public boolean delete(String id) {
		try {
			product = get(id);
			if(product==null) {
				return false;
			}
			getSession().delete(product);
			return true;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}	
	}

	@SuppressWarnings("unchecked")
	public List<Product> list() {
		return getSession().createQuery("from Product").list();
	}

}
