package in.flipbay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.flipbay.dao.CartDAO;
import in.flipbay.dao.ProductDAO;
import in.flipbay.domain.Cart;
import in.flipbay.domain.Product;
import in.flipbay.domain.User;

@Controller
public class CartController {
	
	@Autowired private CartDAO cartDAO;
	
	@Autowired private Cart cart;
	
	@Autowired private HttpSession httpSession;
	
	@Autowired private Product product;
	
	@Autowired private ProductDAO productDAO;
	
	@Autowired private User user;
	
	double grandTotal=0.0;
	
	@GetMapping("product/cart/add")
	public ModelAndView addToCart(@RequestParam int productID) {
		
		ModelAndView mv = new ModelAndView("home");
		
		
		String loggedInUserID = (String)httpSession.getAttribute("loggedInUserID");
		
		if(loggedInUserID==null) {
			
			mv.addObject("errorMessage", "Please login to add any product to cart");
			
		}
		
		product = productDAO.get(productID);
		cart.setEmailID(loggedInUserID);
		cart.setPrice(product.getPrice());
		cart.setProductName(product.getName());
		cart.setProductID(product.getId());
		cart.setQuantity(1);
		
		if(cartDAO.saveOrUpdate(cart)) {
			mv.addObject("cartSaveSuccessMessage", "The product added to cart successfully");
			List<Cart> myCart = cartDAO.list(user.getEmailID());
			httpSession.setAttribute("cartSize", myCart.size());
		}
		else {
			mv.addObject("cartSaveErrorMessage", "Could not add product to the cart");
		}
		return mv;
		
	}
	
	
	@GetMapping("cart")
	public ModelAndView getCartDetails() {
		
		ModelAndView mv = new ModelAndView("home");
		
		String loggedInUserID = (String) httpSession.getAttribute("loggedInUserID");
		
		if(loggedInUserID==null) {
			
			mv.addObject("errorMessage", "Please login to see your cart details.");
			return mv;
			
		}
		
		List<Cart> userCart = cartDAO.list(loggedInUserID);
		for(Cart cart:userCart) {
			double	subTotal=0.0;
		subTotal=(cart.getPrice())*(cart.getQuantity());
			System.out.println(subTotal);
		grandTotal=grandTotal+subTotal;
		System.out.println(grandTotal);
			
		}
		mv.addObject("userCart", userCart);
		httpSession.setAttribute("grandTotal", grandTotal);
		grandTotal=0.0;
		mv.addObject("isUserClickedMyCart", true);
		return mv;
		
	}

}
