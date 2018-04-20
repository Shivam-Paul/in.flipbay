package in.flipbay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import in.flipbay.dao.ProductDAO;
import in.flipbay.domain.Product;
import in.flipbay.util.FileUtil;

@Controller
public class ProductController {
	
	Logger log = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductDAO productDAO;
	
	@Autowired
	private HttpSession httpSession;
	
	@Autowired
	private Product product;
	
	@Autowired
	private FileUtil fileUtil;
	
	//this controller to get all products
	@GetMapping("/product/getAll")
	public ModelAndView getAllProducts() { 		
		
		log.debug("Starting of the method getAllProducts");
		
		ModelAndView mv = new ModelAndView();
		List<Product> allProducts = productDAO.list();
		mv.addObject("allProducts", allProducts);
		
		
		return mv;
	}
	
	//this controller to get a single product
	@GetMapping("/product/get")
	public ModelAndView getProduct(@RequestParam int id) { 		
		
		log.debug("Starting of the method getProduct");
		
		
		
		ModelAndView mv = new ModelAndView("home");
		product = productDAO.get(id);
		mv.addObject("selectedProduct", product);
		mv.addObject("isUserSelectedAProduct",true);
		String selectedProductImageDir = (String)httpSession.getAttribute("baseImageDirectory")+"products\\";
		String selectedProductImage = selectedProductImageDir+product.getName();
		mv.addObject("selectedProductImage",selectedProductImage);
		return mv;
	}
	
	//this controller to save a product into database
	@PostMapping("/product/save")
	public ModelAndView saveProduct(@RequestParam("productID") int productID, @RequestParam("productName") String productName,
			@RequestParam("productDescription") String productDescription, @RequestParam("categoryID") String categoryID,
			@RequestParam("supplierID") String supplierID, @RequestParam("productPrice") Integer productPrice,
			@RequestParam("productQuantity") int productQuantity, @RequestParam("file") MultipartFile file) {
		
		log.debug("Starting of the method saveProduct");

		
		ModelAndView mv = new ModelAndView("redirect:/product");	
		
		product.setId(productID);
		product.setName(productName);
		product.setDescription(productDescription);
		product.setCategoryID(categoryID);
		product.setSupplierID(supplierID);
		product.setPrice(productPrice);
		product.setQuantity(productQuantity);
		

		if(productDAO.save(product)) { 		
			
			
			List<Product> products = productDAO.list();
			httpSession.setAttribute("products", products);
			String productImagesDirectory = ((String)httpSession.getAttribute("baseImageDirectory"))+"products\\";
			httpSession.setAttribute("productImagesDirectory", productImagesDirectory);
			mv.addObject("saveProductSuccessMessage","The product saved successfully");	
			if(fileUtil.fileCopyNIO(file, productName + ".png", productImagesDirectory)) {
				
				mv.addObject("fileUploadSuccessMessage", "File uploaded Successfully");
			}
			else {
				
				mv.addObject("fileUploadErrorMessage", "File failed to upload");
			}
			mv.addObject("selectedProduct", product);
		}
		else {
			mv.addObject("saveProductErrorMessage",true);
		}
		return mv;
	}
	
	@PostMapping("/product/update")
	public ModelAndView updateProduct(@RequestParam("productName") String productName,
			@RequestParam("productDescription") String productDescription, @RequestParam("categoryID") String categoryID,
			@RequestParam("supplierID") String supplierID, @RequestParam("productPrice") Integer productPrice,
			@RequestParam("productQuantity") int productQuantity, @RequestParam("file") MultipartFile file) {
		
		log.debug("Starting of the method saveProduct");

		
		ModelAndView mv = new ModelAndView("redirect:/product");	
		product.setName(productName);
		product.setDescription(productDescription);
		product.setCategoryID(categoryID);
		product.setSupplierID(supplierID);
		product.setPrice(productPrice);
		product.setQuantity(productQuantity);
		

		if(productDAO.update(product)) { 		
			
			
			List<Product> products = productDAO.list();
			httpSession.setAttribute("products", products);
			mv.addObject("saveProductSuccessMessage","The product saved successfully");	
			if(fileUtil.fileCopyNIO(file, productName + ".png", ((String)httpSession.getAttribute("baseImageDirectory"))+"products\\")) {
				
				mv.addObject("fileUploadSuccessMessage", "File uploaded Successfully");
			}
			else {
				
				mv.addObject("fileUploadErrorMessage", "File failed to upload");
			}
			mv.addObject("selectedProduct", product);
		}
		else {
			mv.addObject("saveProductErrorMessage",true);
		}
		httpSession.removeAttribute("selectedProduct");
		return mv;
	}
	
	@GetMapping("/product/edit")
	public ModelAndView editProduct(@RequestParam int id) { 		
		List<Product> products = productDAO.list();
		httpSession.setAttribute("products", products);
		ModelAndView mv = new ModelAndView("redirect:/product");
		mv.addObject("isAdminClickedEditProducts",true);
		product = productDAO.get(id);
		httpSession.setAttribute("selectedProduct", product);
		return mv;
	}
	
	
	
	//this controller is to delete the product
	@GetMapping("/product/delete")
	public ModelAndView deleteProduct(@RequestParam int id) { 		
		
		log.debug("Starting of the method deleteProduct");
		
		ModelAndView mv = new ModelAndView("redirect:/product");
		if (productDAO.delete(id) == true) { 		
			List<Product> allProducts = productDAO.list();
			httpSession.setAttribute("allProducts", allProducts);
			mv.addObject("successMessage", "The product deleted successfully");
		} else {
			mv.addObject("errorMessage", "Could not delete the product.");
		}
		return mv;
	}
	
	 @GetMapping("/viewAllProducts")
	 public ModelAndView viewAllProducts() { 		
		 
		 log.debug("Starting of the method viewAllProducts");
		 
		 List<Product> products = productDAO.list();
		 httpSession.setAttribute("products", products);
		 
		 ModelAndView mv = new ModelAndView("home");
		 mv.addObject("isUserClickedViewAllProducts", true);
		 return mv;
		 
	 }
	 
	 @GetMapping("/search")
	 public ModelAndView searchProducts(@RequestParam("searchString") String searchString) { 	
		 
		 log.debug("Starting of the method searchProducts");
		 
		 ModelAndView mv = new ModelAndView("home");
		 
		 List<Product> searchProducts = productDAO.search(searchString);
		 System.out.println(searchProducts);
		
		 mv.addObject("searchProducts", searchProducts);
		 mv.addObject("isUserClickedSearchProducts", true);
		 return mv;
		 
	 }

}
