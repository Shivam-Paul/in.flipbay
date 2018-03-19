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

	
	//http://localhost:8080/ShoppingCartFrontEnd/
	@GetMapping("/")
	public ModelAndView  home()
	{
		ModelAndView mv = new ModelAndView("home");
		List<Category> categories = categoryDAO.list();
		
		httpSession.setAttribute("categories", categories);
return mv;
		
	}
	
	@GetMapping("/login")
	public ModelAndView  login()
	{
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isUserClickedLogin", true);
		return mv;
		
	}
	
	@GetMapping("/register")
	public ModelAndView  registration()
	{
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isUserClickedRegister", true);
		return mv;
		
	}
	
	@GetMapping("/category")
	public ModelAndView  category()
	{
		
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isUserClickedCategory", true);
		return mv;
		
	}
	
	@GetMapping("/addCategory")
	public ModelAndView  addCategory()
	{
		ModelAndView mv = new ModelAndView("home");
		mv.addObject("isUserClickedAddCategory", true);
		return mv;
		
	}

}
