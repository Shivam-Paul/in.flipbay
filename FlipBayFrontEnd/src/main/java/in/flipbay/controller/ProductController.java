package in.flipbay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import in.flipbay.dao.ProductDAO;
import in.flipbay.domain.Category;
import in.flipbay.domain.Product;
import in.flipbay.util.FileUtil;

@Controller
public class ProductController {
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private HttpSession httpSession;
	
	@Autowired
	private Product product;
	
	//@Autowired
	//private Product product;
	
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
	public ModelAndView saveProduct(@RequestParam("productID") String productID, @RequestParam("productName") String productName,
			@RequestParam("productDescription") String productDescription,@RequestParam("categoryID") String categoryID,
			@RequestParam("supplierID") String supplierID,@RequestParam("productPrice") String productPrice,
			@RequestParam("file") MultipartFile file)
	{
		ModelAndView mv = new ModelAndView("redirect:/product");	
		product.setId(productID);
		product.setName(productName);
		product.setDescription(productDescription);
		product.setCategoryID(categoryID);
		product.setSupplierID(supplierID);
		product.setPrice(productPrice);

		if(productDAO.saveOrUpdate(product)) {	
			List<Product> products = productDAO.list();
			httpSession.setAttribute("products", products);
			mv.addObject("saveOrUpdateProductSuccessMessage","The product saved successfully");	
			FileUtil.copyFile(file, productID+"png");
			mv.addObject("uploadSuccessMessage", "File uploaded Successfully");
			mv.addObject("selectedProduct", product);
		}
		else {
			mv.addObject("saveOrUpdateProductErrorMessage",true);
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
