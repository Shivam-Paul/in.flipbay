package in.flipbay.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.flipbay.dao.ProductDAO;
import in.flipbay.domain.Product;

@Repository("productDAO")
@Transactional
public class ProductDAOImpl implements ProductDAO {
	
	Logger log = LoggerFactory.getLogger(ProductDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private Product product;

	int minPrice = 0;

	public ProductDAOImpl(SessionFactory sessionFactory) {

		this.sessionFactory = sessionFactory;

	}

	public ProductDAOImpl() {

	}

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public boolean save(Product product) {
		
		log.debug("Starting of the method save in ProductDAOImpl");
		
		try {
			if (product.getDescription() == null) {
				product.setDescription(product.getName());
			}
			getSession().save(product);
			
			log.debug("Ending of the method save in ProductDAOImpl");
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();			
			return false;
		}
	}

	public boolean update(Product product) {
		
		log.debug("Starting of the method update in ProductDAOImpl");

		try {
			getSession().update(product);
			
			log.debug("Ending of the method update in ProductDAOImpl");

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public Product get(int id) {
		
		log.debug("get method called in ProductDAOImpl");
	
		return getSession().get(Product.class, id);

	}

	public boolean delete(int id) {
		
		log.debug("Starting of the method save in ProductDAOImpl");

		try {
			product = get(id);
			if (product == null) {
				
				log.debug("No product found with id= "+id+" to delete");

				return false;
			}
			getSession().delete(product);
			
			log.debug("Ending of the method save in ProductDAOImpl");

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<Product> list() {
		
		log.debug("list method called in ProductDAOImpl");
		

		return getSession().createQuery("from Product").list();
	}

	public List<Product> search(String searchString) {
		
		log.debug("Starting of the method search("+searchString+") in ProductDAOImpl");

		String hql = "from Product where description like '%" + searchString + "%'";
		
		log.debug("Ending of the method search(string) in ProductDAOImpl");

		return sessionFactory.getCurrentSession().createQuery(hql).list();

	}

	public List<Product> search(String searchString, int minPrice, int maxPrice) {
		
		log.debug("Starting of the method search("+searchString+", "+minPrice+", "+maxPrice+") in ProductDAOImpl");

		String hql = "from Product where description like '%" + searchString + "%' and price between " + minPrice
				+ " and " + maxPrice;
		
		log.debug("Ending of the method search(string, min, max) in ProductDAOImpl");

		return sessionFactory.getCurrentSession().createQuery(hql).list();

	}

}
