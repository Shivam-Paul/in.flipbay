package in.flipbay.dao;

import java.util.List;

import in.flipbay.domain.Cart;
import in.flipbay.domain.CartItem;

public interface CartItemDAO {
	
	public CartItem get(int cartItemID);
	
	public boolean addCartItem(CartItem cartItem);
	
	public boolean updateCartItem(CartItem cartItem);
	
	public boolean deleteCartItem(CartItem cartItem);
	
	public List<CartItem> list(int cartID);
	
	public CartItem getByCartAndProduct(int cartID, int productID);
	
	public Cart getCart(String emailID);
	
	public boolean addCart(Cart cart);
	
	public boolean update(Cart cart);
	
	

}
