package in.flipbay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import in.flipbay.dao.CategoryDAO;
import in.flipbay.domain.Category;

@Controller
public class HomeController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private HttpSession httpSession;
	
	private static String baseImageDirectory = "C:\\Training\\FlipBayFrontEnd\\src\\main\\webapp\\resources\\images\\";

	
	//http://localhost:8080/ShoppingCartFrontEnd/
	@GetMapping("/")
	public ModelAndView  home()
	{
		ModelAndView mv = new ModelAndView("home");
		List<Category> allCategories = categoryDAO.list();
		
		httpSession.setAttribute("allCategories", allCategories);
		httpSession.setAttribute("baseImageDirectory", baseImageDirectory);
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
