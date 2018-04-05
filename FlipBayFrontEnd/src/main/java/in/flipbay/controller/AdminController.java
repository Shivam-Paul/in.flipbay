package in.flipbay.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import in.flipbay.dao.CategoryDAO;
import in.flipbay.dao.ProductDAO;
import in.flipbay.dao.SupplierDAO;
import in.flipbay.dao.UserDAO;
import in.flipbay.domain.Category;
import in.flipbay.domain.Product;
import in.flipbay.domain.Supplier;
import in.flipbay.domain.User;

@Controller
public class AdminController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private SupplierDAO supplierDAO;
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private HttpSession httpSession;
	
	@Autowired
	private UserDAO userDAO;
	
	
	@GetMapping("/category")
	public ModelAndView  manageCategories()
	{
		List<Category> allCategories = categoryDAO.list();
		httpSession.setAttribute("allCategories", allCategories);
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isAdminClickedManageCategories", true);	
		return mv;
		
	}
	@GetMapping("/supplier")
	public ModelAndView  manageSuppliers()
	{
		List<Supplier> allSuppliers = supplierDAO.list();
		httpSession.setAttribute("allSuppliers", allSuppliers);
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isAdminClickedManageSuppliers", true);
		return mv;
		
	}
	@GetMapping("/product")
	public ModelAndView  manageProducts()
	{
		List<Category> allCategories = categoryDAO.list();
		httpSession.setAttribute("allCategories", allCategories);
		List<Supplier> allSuppliers = supplierDAO.list();
		httpSession.setAttribute("allSuppliers", allSuppliers);
		List<Product> allProducts = productDAO.list();
		httpSession.setAttribute("allProducts", allProducts);
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isAdminClickedManageProducts", true);
		return mv;
		
	}
	
	@GetMapping("/user")
	public ModelAndView  manageUsers()
	{
		List<User> allUsers = userDAO.list();
		httpSession.setAttribute("allUsers", allUsers);
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isAdminClickedManageUsers", true);
		return mv;
	}
	


}
