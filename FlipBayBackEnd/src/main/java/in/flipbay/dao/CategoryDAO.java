package in.flipbay.dao;

import java.util.List;

import in.flipbay.domain.Category;

public interface CategoryDAO {
	
	public boolean save(Category category);
	
	public boolean update(Category category);
	
	public Category get(String id);
	
	public boolean delete(String id);
	
	public List<Category> list();
	



}
