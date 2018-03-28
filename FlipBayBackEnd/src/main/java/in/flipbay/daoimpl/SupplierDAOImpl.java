package in.flipbay.daoimpl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import in.flipbay.dao.SupplierDAO;
import in.flipbay.domain.Supplier;

@Repository("supplierDAO")
@Transactional
public class SupplierDAOImpl implements SupplierDAO{
	
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

	public boolean saveOrUpdate(Supplier supplier) {
		try {
			getSession().saveOrUpdate(supplier);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}		
	}

	public boolean update(Supplier supplier) {
		try {
			getSession().update(supplier);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public Supplier get(String id) {

		return getSession().get(Supplier.class, id);
		
	}

	public boolean delete(String id) {
		try {
			supplier = get(id);
			if(supplier==null) {
				return false;
			}
			getSession().delete(supplier);
			return true;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}	
	}

	

	@SuppressWarnings("unchecked")
	public List<Supplier> list() {
		return getSession().createQuery("from Supplier").list();
	}
	
	

}
