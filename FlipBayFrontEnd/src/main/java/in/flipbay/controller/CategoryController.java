package in.flipbay.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import in.flipbay.dao.CategoryDAO;
import in.flipbay.domain.Category;
import in.flipbay.util.FileUtil;

@Controller
public class CategoryController {
	
	@Autowired
	private CategoryDAO categoryDAO;
	
	@Autowired
	private Category category;
	
	@Autowired
	private HttpSession httpSession;
	
	@Autowired
	private FileUtil fileUtil;
	
	
	//this controller to save a category into database
	@PostMapping("/category/save")
	public ModelAndView saveOrUpdateCategory(@RequestParam("categoryName") String categoryName
			, @RequestParam("categoryDescription") String categoryDescription, @RequestParam("file") MultipartFile file)  {	
		
		ModelAndView mv = new ModelAndView("redirect:/category");	
		category.setName(categoryName);
		category.setDescription(categoryDescription);
		
		int categoryID = category.getId();

		
		if(categoryDAO.saveOrUpdate(category)) {	
			List<Category> categories = categoryDAO.list();
			httpSession.setAttribute("categories", categories);
			
			String baseImageDirectory = (String)httpSession.getAttribute("baseImageDirectory");
			String categoryImagesDirectory = baseImageDirectory + "categories\\";
			httpSession.setAttribute("categoryImagesDirectory", categoryImagesDirectory);
			
			fileUtil.fileCopyNIO(file, categoryID + ".png", categoryImagesDirectory);
			mv.addObject("uploadSuccessMessage", "File uploaded Successfully");
			
			mv.addObject("saveOrUpdateCategorySuccessMessage","The category saved successfully");	
			mv.addObject("selectedCategory", category);
		}
		else {
			mv.addObject("saveOrUpdateCategoryErrorMessage",true);
		}
		
		return mv;
	}
	
	
	
	//this controller is to update the category details
	@GetMapping("/category/edit")
	public ModelAndView editCategory(@RequestParam int id) {
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
	public ModelAndView deleteCategory(@RequestParam int id) {
		
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

