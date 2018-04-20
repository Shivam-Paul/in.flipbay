package in.flipbay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.flipbay.dao.AddressDAO;
import in.flipbay.dao.CartItemDAO;
import in.flipbay.dao.ProductDAO;
import in.flipbay.domain.Address;
import in.flipbay.domain.Cart;
import in.flipbay.domain.CartItem;
import in.flipbay.domain.Product;
import in.flipbay.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {
	
	
	@Autowired
	private CartService cartService;
	
	@Autowired CartItemDAO cartItemDAO;
	
	@Autowired CartItem cartItem;
	
	@Autowired HttpSession httpSession;
	
	@Autowired Cart cart;
	
	@Autowired Product product;
	
	@Autowired ProductDAO productDAO;
	
	@Autowired Address address;
	
	@Autowired AddressDAO addressDAO;
	
	
	
	@GetMapping("/cart")
	public ModelAndView myCart() {
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isUserClickedMyCart", true);
		
		cart = cartItemDAO.getCart((String)httpSession.getAttribute("loggedInUserID"));
		
		List<CartItem> myCart = cartItemDAO.list(cart.getId());
		httpSession.setAttribute("myCart", myCart);
		httpSession.setAttribute("cartSize", myCart.size());
		mv.addObject("grandTotal", cart.getGrandTotal());

		
		return mv;
		
	}
	
	@RequestMapping("/billing")
	public ModelAndView billing() {
		
		ModelAndView mv = new ModelAndView("home");
		
		mv.addObject("isUserFilledShippingAddress", true);
		
		return mv;
		
	}
	
	@PostMapping("/add/product")
	public String addCartItem(@RequestParam("productID") int productID, @RequestParam("quantity") int quantity) {
		
	cartService.addCartItem(productID, quantity);	
	List<CartItem> myCart = cartItemDAO.list(cart.getId());
	httpSession.setAttribute("cartSize", myCart.size());
	return "redirect:/viewAllProducts";	
	
	}
	
	@GetMapping("/delete/{cartItemID}")
	public String deleteCartItem(@PathVariable int cartItemID) {
		
		cartService.deleteCartItem(cartItemID);
		List<CartItem> myCart = cartItemDAO.list(cart.getId());
		httpSession.setAttribute("cartSize", myCart.size());
		return "redirect:/cart/cart";
		
	}
	
	@RequestMapping("/update/{cartItemID}")
	public String udpateCartLine(@PathVariable int cartItemID, @RequestParam int count) {
		
	cartService.updateCartItem(cartItemID, count);
	List<CartItem> myCart = cartItemDAO.list(cart.getId());
	httpSession.setAttribute("cartSize", myCart.size());
	
	return "redirect:/cart/cart";	
	}
	
	@RequestMapping("/deleteWholeCart")
	public String deleteWholeCart() {
		
		String emailID = (String)httpSession.getAttribute("loggedInUserID");
		cart = cartItemDAO.getCart(emailID);
		List<CartItem> allItems = cartItemDAO.list(cart.getId());
		for(CartItem items : allItems) {
			
			deleteCartItem(items.getCartItemID());
			
		}
		cart.setCartItem(0);
		cart.setEmailID(emailID);
		cart.setGrandTotal(0.0);
		cart.setId(cart.getId());
		
		cartItemDAO.update(cart);
		List<CartItem> myCart = cartItemDAO.list(cart.getId());
		httpSession.setAttribute("cartSize", myCart.size());
		
		return "redirect:/viewAllProducts";
		
	}
	
	@RequestMapping("/checkout")
	public String checkout() {
		
		String emailID = (String)httpSession.getAttribute("loggedInUserID");
		cart = cartItemDAO.getCart(emailID);
		List<CartItem> allItems = cartItemDAO.list(cart.getId());
		for(CartItem items : allItems) {
			
			product = productDAO.get(items.getProductID());
			
			product.setQuantity(product.getQuantity()-items.getQuantity());
			product.setDescription(product.getDescription());
			product.setId(product.getId());
			product.setCategoryID(product.getCategoryID());
			product.setSupplierID(product.getSupplierID());
			product.setPrice(product.getPrice());
			product.setName(product.getName());
			productDAO.update(product);
			
			deleteCartItem(items.getCartItemID());
			
		}
		
		httpSession.setAttribute("grandTotal", cart.getGrandTotal());

		cart.setCartItem(0);
		cart.setEmailID(emailID);
		cart.setGrandTotal(0.0);
		cart.setId(cart.getId());
		
		cartItemDAO.update(cart);
		List<CartItem> myCart = cartItemDAO.list(cart.getId());
		httpSession.setAttribute("cartSize", myCart.size());
		
		return "redirect:/cart/billing";
		
	}
	
	@GetMapping("/fillShippingAddress")
	public ModelAndView fillShippingAddress() {
		
		ModelAndView mv = new ModelAndView("home");
		
		mv.addObject("isUserClickedCheckout", true);
		
		return mv;
		
	}
	
	@PostMapping("/shippingAddress")
	public ModelAndView addAddress(@RequestParam("houseNumber") int hn, @RequestParam("street") String st,
			@RequestParam("city") String ci
			,@RequestParam("state") String sta, @RequestParam("country") String co, @RequestParam("pincode") int pi) {
		
		
		ModelAndView mv = new ModelAndView("redirect:/cart/fillShippingAddress");	

		
		/*httpSession.setAttribute("hn", hn);
		httpSession.setAttribute("st", st);
		httpSession.setAttribute("ci", ci);
		httpSession.setAttribute("sta", sta);
		httpSession.setAttribute("co", co);
		httpSession.setAttribute("pi", pi);*/

		/*System.out.println(city);
		System.out.println(state);
		System.out.println(country);
		System.out.println(pincode);
		System.out.println(street);
		System.out.println(houseNumber);
		System.out.println(httpSession.getAttribute("loggedInUserID"));*/

	
		address.setStreet(st);
		address.setCity(ci);
		address.setCountry(co);
		address.setEmailID((String)httpSession.getAttribute("loggedInUserID"));
		address.setPincode(pi);
		address.setState(sta);
		address.setHouseNumber(hn);

		addressDAO.save(address);

	
		httpSession.setAttribute("shippingAddress", address);
				
		return mv;
		
	}
	

}
