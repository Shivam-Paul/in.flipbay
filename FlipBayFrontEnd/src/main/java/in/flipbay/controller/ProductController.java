package in.flipbay.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.flipbay.dao.ProductDAO;
import in.flipbay.domain.Product;

@Controller
public class ProductController {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private Product product;
	
	//this controller to get all products
	@GetMapping("/product/getAll")
	public ModelAndView getAllProducts() {
		
		ModelAndView mv = new ModelAndView();
		List<Product> allProducts = productDAO.list();
		mv.addObject("allProducts", allProducts);
		return mv;
	}
	
	//this controller to get a single product
	@GetMapping("/product/get/{id}")
	public ModelAndView getProduct(@RequestParam("id") String id) {
		
		ModelAndView mv = new ModelAndView();
		Product product=productDAO.get(id);
		mv.addObject("product", product);
		return mv;
	}
	
	//this controller to save a product into database
	@PostMapping("/product/save")
	public ModelAndView saveProduct(@RequestBody Product product)  {
		ModelAndView mv = new ModelAndView();
		if(productDAO.save(product) == true) { 	
			mv.addObject("successMessage","The product saved successfully");	
		}
		else {	
			mv.addObject("failureMessage", "The product failed to save");
		}
		return mv;
	}
	
	//this controller is to update the product details
	@PutMapping("/product/update")
	public ModelAndView updateProduct(@RequestBody Product product) {
		ModelAndView mv = new ModelAndView("home");
		if (productDAO.update(product) == true) {
			mv.addObject("successMessage", "The product updated successfully");
		} else {
			mv.addObject("errorMessage", "Could not update the product.");
		}
		return mv;
	}
	
	//this controller is to delete the product
	@DeleteMapping("/product/delete/{id}")
	public ModelAndView deleteProduct(@RequestParam("id") String id) {
		ModelAndView mv = new ModelAndView("home");
		if (productDAO.delete(id) == true) {
			mv.addObject("successMessage", "The product deleted successfully");
		} else {
			mv.addObject("errorMessage", "Could not delete the product.");
		}
		return mv;
	}

}
