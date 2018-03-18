package in.flipbay.dao;

import java.util.List;

import in.flipbay.domain.Supplier;

public interface SupplierDAO {
	
public boolean save(Supplier supplier);
	
	public boolean update(Supplier supplier);
	
	public Supplier get(String id);
	
	public boolean delete(String id);
	
	public List<Supplier> list();

}
