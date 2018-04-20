package in.flipbay.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.flipbay.dao.CartItemDAO;
import in.flipbay.dao.ProductDAO;
import in.flipbay.domain.Cart;
import in.flipbay.domain.CartItem;
import in.flipbay.domain.Product;

@Service("cartService")
public class CartService {

	@Autowired
	private CartItemDAO cartItemDAO;

	@Autowired
	private ProductDAO productDAO;

	@Autowired
	private HttpSession httpSession;

	private Cart getCart() {

		String emailID = (String) httpSession.getAttribute("loggedInUserID");

		Cart cart = cartItemDAO.getCart(emailID);

		return cart;

	}

	public String addCartItem(int productID, int quantity) {

		String response = null;
		Cart cart = this.getCart();
		CartItem cartItem = cartItemDAO.getByCartAndProduct(cart.getId(), productID);

		if (cartItem == null) {
			// add a new cartLine
			cartItem = new CartItem();

			// fetch the product
			Product product = productDAO.get(productID);

			cartItem.setCartID(cart.getId());

			cartItem.setProductID(productID);
			cartItem.setPrice(product.getPrice());
			cartItem.setQuantity(quantity);
			cartItem.setSubTotal(product.getPrice()*quantity);
			cartItem.setProductName(product.getName());
			cartItem.setAvlQuantity(product.getQuantity());

			cartItemDAO.addCartItem(cartItem);

			cart.setCartItem(cartItem.getCartItemID());
			cart.setGrandTotal(cart.getGrandTotal() + cartItem.getSubTotal());
			cartItemDAO.update(cart);
			response = "result=added";

		}

		return response;

	}
	
	public String deleteCartItem(int cartItemID) {
		
		//fetch the cartLine
		CartItem cartItem = cartItemDAO.get(cartItemID);
		
		if(cartItem == null) {
		return "result=error";
		}
		else {
		// update the cart
		Cart cart = this.getCart();
		cart.setGrandTotal(cart.getGrandTotal() - cartItem.getSubTotal());
		cart.setCartItem(cart.getCartItem() - 1);
		cartItemDAO.update(cart);
		
		// remove the cart line
		cartItemDAO.deleteCartItem(cartItem);
		
		return "result=deleted";
		
		}
		
		}
	
	public String updateCartItem(int cartItemID, int count) {
		
		//fetch the cart line
		CartItem cartItem = cartItemDAO.get(cartItemID);
		
		if(cartItem == null) {
		return "result=error";
		}
		
		else {
		
		Product product = cartItem.getProduct();
		double oldTotal = cartItem.getSubTotal();
		if(product.getQuantity() <= count) {
		count = product.getQuantity();
		}
		cartItem.setQuantity(count);
		cartItem.setPrice(product.getPrice());
		cartItem.setSubTotal(product.getPrice() * count);
		cartItemDAO.updateCartItem(cartItem);
		Cart cart = this.getCart();
		cart.setGrandTotal(cart.getGrandTotal() - oldTotal + cartItem.getSubTotal());
		cartItemDAO.update(cart);
		
		return "result=updated";
		}
		
		}

}
