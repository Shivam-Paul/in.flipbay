package in.flipbay.dao;

import java.util.List;

import in.flipbay.domain.Cart;

public interface CartDAO {
	
	public boolean saveOrUpdate(Cart cart);
	
	public Cart get(int id);
	
	public boolean delete(int id);
	
	public List<Cart> list(String emailID);

}
