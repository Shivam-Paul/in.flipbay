package in.flipbay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@Autowired
	private HttpSession httpSession;
	
	//this controller to get all suppliers
//	@GetMapping("/supplier/getAll")
//	public ModelAndView getAllSuppliers() {
//		
//		ModelAndView mv = new ModelAndView();
//		List<Supplier> allSuppliers = supplierDAO.list();
//		httpSession.setAttribute("allSuppliers", allSuppliers);
//		return mv;
//	}
	
	//this controller to get a single supplier
	@GetMapping("/supplier/get/{id}")
	public ModelAndView getSupplier(@RequestParam("id") String id) {
		
		ModelAndView mv = new ModelAndView();
		Supplier supplier=supplierDAO.get(id);
		mv.addObject("supplier", supplier);
		return mv;
	}
	
	@PostMapping("supplier/save")
	public ModelAndView savesupplier(@RequestParam("supplierID") String supplierID, @RequestParam("supplierName") String supplierName
			, @RequestParam("supplierAddress") String supplierAddress)  {
		ModelAndView mv = new ModelAndView("redirect:/supplier");	
		
		supplier.setId(supplierID);
		supplier.setName(supplierName);
		supplier.setAddress(supplierAddress);
		
		
//		while(true) {
//		if(supplierDAO.get("SUP_"+ randomNum.nextInt(100))!=null) {
//			supplierID = "SUP_"+ randomNum.nextInt(100);
//			break;
//		}}
		
		//System.out.println(supplierID);

		if(supplierDAO.saveOrUpdate(supplier)) {	
			List<Supplier> suppliers = supplierDAO.list();
			httpSession.setAttribute("suppliers", suppliers);
			mv.addObject("selectedSupplier", supplier);
			mv.addObject("supplierSaveSuccessMessage","The supplier saved successfully");
		}
		else {
			mv.addObject("supplierSaveErrorMessage","The supplier failed to save");
		}
		
		return mv;
	}
	
	//this controller is to update the supplier details
	@GetMapping("/supplier/edit")
	public ModelAndView editSupplier(@RequestParam String id) {
		List<Supplier> suppliers = supplierDAO.list();
		httpSession.setAttribute("suppliers", suppliers);
		ModelAndView mv = new ModelAndView("redirect:/supplier");
		mv.addObject("isAdminClickedEditSuppliers",true);
		supplier = supplierDAO.get(id);
		httpSession.setAttribute("selectedSupplier", supplier);
		return mv;
	}
	
	//this controller is to delete the supplier
	@GetMapping("/supplier/delete")
	public ModelAndView deleteSupplier(@RequestParam String id) {
		
		ModelAndView mv = new ModelAndView("redirect:/supplier");
		if (supplierDAO.delete(id) == true) {
			List<Supplier> allSuppliers = supplierDAO.list();
			httpSession.setAttribute("allSuppliers", allSuppliers);
			mv.addObject("supplierDeleteSuccessMessage", "The supplier deleted successfully");
		} else {
			mv.addObject("supplierDeleteErrorMessage", "Could not delete the supplier.");
		}
		return mv;
	}

}
