package in.flipbay.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import in.flipbay.dao.CategoryDAO;
import in.flipbay.domain.Category;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private Category category;
	
	@Autowired
	private HttpSession httpSession;
	
	//this controller to get all categories
//	@GetMapping("/category")
//	public ModelAndView getAllCategories() {
//		
//		ModelAndView mv = new ModelAndView();
//		List<Category> allCategories = categoryDAO.list();
//		httpSession.setAttribute("allCategories", allCategories);
//		return mv;
//	}
	
	//this controller to get a single category
	@GetMapping("/category/get/{id}")
	public ModelAndView getCategory(@RequestParam("id") String id) {
		
		ModelAndView mv = new ModelAndView();
		Category category=categoryDAO.get(id);
		mv.addObject("category", category);
		return mv;
	}
	
	//this controller to save a category into database
	@PostMapping("/category/save")
	public ModelAndView saveOrUpdateCategory(@RequestParam("categoryID") String categoryID,
			@RequestParam("categoryName") String categoryName
			, @RequestParam("categoryDescription") String categoryDescription)  {	
		
		ModelAndView mv = new ModelAndView("redirect:/category");	
		category.setId(categoryID);
		category.setName(categoryName);
		category.setDescription(categoryDescription);
		
		if(categoryDAO.saveOrUpdate(category)) {	
			List<Category> categories = categoryDAO.list();
			httpSession.setAttribute("categories", categories);
			mv.addObject("saveOrUpdateCategorySuccessMessage","The category saved successfully");	
			mv.addObject("selectedCategory", category);
		}
		else {
			mv.addObject("saveOrUpdateCategoryErrorMessage",true);
		}
		
		return mv;
	}
	
	
	/*@PostMapping(value = "/category/save")
	public ModelAndView saveOrUpdateUser(@ModelAttribute("categoryForm") Category category,
			BindingResult result, Model model) {
		ModelAndView mv = new ModelAndView();
		if(categoryDAO.save(category) == true) { 	
			mv.addObject("successMessage","The category saved successfully");	
		}
		else {	
			mv.addObject("failureMessage", "The category failed to save");
		}
		return mv;
		}
*/
	
	
	
	//this controller is to update the category details
	@GetMapping("/category/edit")
	public ModelAndView editCategory(@RequestParam String id) {
		List<Category> categories = categoryDAO.list();
		httpSession.setAttribute("categories", categories);
		ModelAndView mv = new ModelAndView("redirect:/category");
		mv.addObject("isAdminClickedEditCategories",true);
		category = categoryDAO.get(id);
		httpSession.setAttribute("selectedCategory", category);
		return mv;
	}
	
	//this controller is to delete the category
	@GetMapping("/category/delete")
	public ModelAndView deleteCategory(@RequestParam String id) {
		
		ModelAndView mv = new ModelAndView("redirect:/category");
		if (categoryDAO.delete(id) == true) {
			List<Category> allCategories = categoryDAO.list();
			httpSession.setAttribute("allCategories", allCategories);
			mv.addObject("successMessage", "The category deleted successfully");
		} else {
			mv.addObject("errorMessage", "Could not delete the category.");
		}
		return mv;
	}

}

/*
Instead of command name use modelAttribute in the form

<form:form method="POST" action="addStudent" modelAttribute="command">
Then in the controller use Model as parameter and add new bean object into the model while loading

@RequestMapping(value = "/student", method = RequestMethod.GET)
   public String student(Model model) {

    model.addAttribute("command",new Student());
      return "student";
   }
Then while submitting the form retrieve the same object to get data from the object

 @RequestMapping(value = "/addStudent", method = RequestMethod.POST)
   public String addStudent(@ModelAttribute("command")Student student, 
   ModelMap model) {.....}
*/