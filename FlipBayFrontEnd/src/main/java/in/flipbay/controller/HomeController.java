package in.flipbay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import in.flipbay.dao.CategoryDAO;
import in.flipbay.dao.SupplierDAO;
import in.flipbay.domain.Category;
import in.flipbay.domain.Supplier;

@Controller
public class HomeController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private HttpSession httpSession;
	
	@Autowired
	private SupplierDAO supplierDAO;
	
	private static String baseImageDirectory = "C:\\Training\\FlipBayFrontEnd\\src\\main\\webapp\\resources\\images\\";


	
	//http://localhost:8080/ShoppingCartFrontEnd/
	@GetMapping("/")
	public ModelAndView  home()
	{
		ModelAndView mv = new ModelAndView("home");
		List<Category> allCategories = categoryDAO.list();
		httpSession.setAttribute("allCategories", allCategories);
		List<Supplier> allSuppliers = supplierDAO.list();
		httpSession.setAttribute("allSuppliers", allSuppliers);

		httpSession.setAttribute("baseImageDirectory", baseImageDirectory);

		
		mv.addObject("isUserClickedHome",true);

		return mv;
		
	}
	
	@GetMapping("/about")
	public ModelAndView  about()
	{
		ModelAndView mv = new ModelAndView("home");
		
		mv.addObject("isUserClickedAbout", true);
		

		return mv;
		
	}
	
	@GetMapping("/contact")
	public ModelAndView  contact()
	{
		ModelAndView mv = new ModelAndView("home");
		
		mv.addObject("isUserClickedContact", true);

		
		

		return mv;
		
	}
	
	@GetMapping("/home")
	public ModelAndView  homepage()
	{
		ModelAndView mv = new ModelAndView("home");
		List<Category> allCategories = categoryDAO.list();
		
		httpSession.setAttribute("allCategories", allCategories);
		httpSession.setAttribute("baseImageDirectory", baseImageDirectory);
		mv.addObject("isUserClickedHome",true);

		

		return mv;
		
	}
	
	@GetMapping("/login")
	public ModelAndView  login()
	{
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isUserClickedLogin", true);
		return mv;
		
	}
	
	@GetMapping("/registration")
	public ModelAndView  registration()
	{
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isUserClickedRegister", true);
		return mv;
		
	}
	

}
