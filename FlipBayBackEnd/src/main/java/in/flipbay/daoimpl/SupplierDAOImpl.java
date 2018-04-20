package in.flipbay.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.flipbay.dao.SupplierDAO;
import in.flipbay.domain.Supplier;

@Repository("supplierDAO")
@Transactional
public class SupplierDAOImpl implements SupplierDAO {
	
	Logger log = LoggerFactory.getLogger(SupplierDAOImpl.class);
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private Supplier supplier;
	
	
	
public SupplierDAOImpl(SessionFactory sessionFactory) {
		
		this.sessionFactory = sessionFactory;
		
	}
	
	public SupplierDAOImpl() 
	{
		
	}
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public boolean save(Supplier supplier) {
		
		log.debug("Starting of the method save in SupplierDAOImpl");

		try {
			getSession().save(supplier);
			
			log.debug("Ending of the method save in SupplierDAOImpl");

			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
	}
	
	public boolean update(Supplier supplier) {
		
		log.debug("Starting of the method update in SupplierDAOImpl");
		
		try {
			getSession().update(supplier);
			
			log.debug("Ending of the method update in SupplierDAOImpl");

			return true;
		}
		catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}


	public Supplier get(int id) {
		
		log.debug("get method called in SupplierDAOImpl");

		return getSession().get(Supplier.class, id);
		
	}

	public boolean delete(int id) {
		
		log.debug("Starting of the method delete in SupplierDAOImpl");

		try {
			supplier = get(id);
			if(supplier==null) {
				
				log.debug("No supplier found with id= "+id+" to delete");

				return false;
			}
			getSession().delete(supplier);
			
			log.debug("Ending of the method delete in SupplierDAOImpl");

			return true;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}	
	}

	

	@SuppressWarnings("unchecked")
	public List<Supplier> list() {

		log.debug("list method called in SupplierDAOImpl");

		return getSession().createQuery("from Supplier").list();

	}
	
	

}
