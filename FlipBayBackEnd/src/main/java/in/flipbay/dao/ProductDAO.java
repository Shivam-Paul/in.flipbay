package in.flipbay.dao;

import java.util.List;

import in.flipbay.domain.Product;

public interface ProductDAO {

	public boolean save(Product product);

	public boolean update(Product product);

	public Product get(int id);

	public boolean delete(int id);

	public List<Product> list();

	public List<Product> search(String searchString);

	public List<Product> search(String searchString, int minPrice, int maxPrice);

}
