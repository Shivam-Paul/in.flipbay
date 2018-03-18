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

import in.flipbay.dao.SupplierDAO;
import in.flipbay.domain.Supplier;

@Controller
public class SupplierController {
	
	@Autowired
	private SupplierDAO supplierDAO;
	
	@Autowired
	private Supplier supplier;
	
	//this controller to get all suppliers
	@GetMapping("/supplier/getAll")
	public ModelAndView getAllSuppliers() {
		
		ModelAndView mv = new ModelAndView();
		List<Supplier> allSuppliers = supplierDAO.list();
		mv.addObject("allSuppliers", allSuppliers);
		return mv;
	}
	
	//this controller to get a single supplier
	@GetMapping("/supplier/get/{id}")
	public ModelAndView getSupplier(@RequestParam("id") String id) {
		
		ModelAndView mv = new ModelAndView();
		Supplier supplier=supplierDAO.get(id);
		mv.addObject("supplier", supplier);
		return mv;
	}
	
	//this controller to save a supplier into database
	@PostMapping("/supplier/save")
	public ModelAndView saveSupplier(@RequestBody Supplier supplier)  {
		ModelAndView mv = new ModelAndView();
		if(supplierDAO.save(supplier) == true) { 	
			mv.addObject("successMessage","The supplier saved successfully");	
		}
		else {	
			mv.addObject("failureMessage", "The supplier failed to save");
		}
		return mv;
	}
	
	//this controller is to update the supplier details
	@PutMapping("/supplier/update")
	public ModelAndView updateSupplier(@RequestBody Supplier supplier) {
		ModelAndView mv = new ModelAndView("home");
		if (supplierDAO.update(supplier) == true) {
			mv.addObject("successMessage", "The supplier updated successfully");
		} else {
			mv.addObject("errorMessage", "Could not update the supplier.");
		}
		return mv;
	}
	
	//this controller is to delete the supplier
	@DeleteMapping("/supplier/delete/{id}")
	public ModelAndView deleteSupplier(@RequestParam("id") String id) {
		ModelAndView mv = new ModelAndView("home");
		if (supplierDAO.delete(id) == true) {
			mv.addObject("successMessage", "The supplier deleted successfully");
		} else {
			mv.addObject("errorMessage", "Could not delete the supplier.");
		}
		return mv;
	}

}
