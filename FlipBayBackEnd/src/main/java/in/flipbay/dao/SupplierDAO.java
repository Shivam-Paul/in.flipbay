package in.flipbay.dao;

import java.util.List;

import in.flipbay.domain.Supplier;

public interface SupplierDAO {
	
public boolean saveOrUpdate(Supplier supplier);
		
	public Supplier get(int id);
	
	public boolean delete(int id);
	
	public List<Supplier> list();

}
