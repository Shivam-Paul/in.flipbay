package in.flipbay.dao;

import java.util.List;

import in.flipbay.domain.Category;

public interface CategoryDAO {
	
	public boolean save(Category category);
	
	public boolean update(Category category);
		
	public Category get(int id);
	
	public boolean delete(int id);
	
	public List<Category> list();
	



}
