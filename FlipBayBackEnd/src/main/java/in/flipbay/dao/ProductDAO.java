package in.flipbay.dao;

import java.util.List;

import in.flipbay.domain.Product;

public interface ProductDAO {
	
public boolean saveOrUpdate(Product product);
		
	public Product get(int id);
	
	public boolean delete(int id);
	
	public List<Product> list();

}
