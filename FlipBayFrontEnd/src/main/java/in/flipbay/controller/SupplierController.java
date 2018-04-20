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

import in.flipbay.dao.SupplierDAO;
import in.flipbay.domain.Supplier;
import in.flipbay.util.FileUtil;

@Controller
public class SupplierController {
	
	@Autowired
	private SupplierDAO supplierDAO;
	
	@Autowired
	private Supplier supplier;
	
	@Autowired
	private HttpSession httpSession;
	
	@Autowired
	private FileUtil fileUtil;

	
	@PostMapping("supplier/save")
	public ModelAndView savesupplier(@RequestParam("supplierName") String supplierName
			, @RequestParam("supplierAddress") String supplierAddress, @RequestParam("file") MultipartFile file)  {
		ModelAndView mv = new ModelAndView("redirect:/supplier");	
		
		supplier.setName(supplierName);
		supplier.setAddress(supplierAddress);
	
		if(supplierDAO.save(supplier)) {	
			List<Supplier> suppliers = supplierDAO.list();
			httpSession.setAttribute("suppliers", suppliers);
			
			String supplierImagesDirectory = ((String)httpSession.getAttribute("baseImageDirectory"))+"suppliers\\";
			httpSession.setAttribute("supplierImagesDirectory", supplierImagesDirectory);
			
			fileUtil.fileCopyNIO(file, supplierName + ".png", supplierImagesDirectory);
			mv.addObject("uploadSuccessMessage", "File uploaded Successfully");
			
			mv.addObject("selectedSupplier", supplier);
			mv.addObject("supplierSaveSuccessMessage","The supplier saved successfully");
		}
		else {
			mv.addObject("supplierSaveErrorMessage","The supplier failed to save");
		}
		
		return mv;
	}
	
	@PostMapping("supplier/update")
	public ModelAndView updateSupplier(@RequestParam("supplierName") String supplierName
			, @RequestParam("supplierAddress") String supplierAddress, @RequestParam("file") MultipartFile file)  {
		ModelAndView mv = new ModelAndView("redirect:/supplier");	
		
		supplier.setName(supplierName);
		supplier.setAddress(supplierAddress);
	
		if(supplierDAO.update(supplier)) {	
			List<Supplier> suppliers = supplierDAO.list();
			httpSession.setAttribute("suppliers", suppliers);
			
			fileUtil.fileCopyNIO(file, supplierName + ".png", ((String)httpSession.getAttribute("baseImageDirectory"))+"suppliers\\");
			mv.addObject("uploadSuccessMessage", "File uploaded Successfully");
			
			mv.addObject("selectedSupplier", supplier);
			mv.addObject("supplierSaveSuccessMessage","The supplier saved successfully");
		}
		else {
			mv.addObject("supplierSaveErrorMessage","The supplier failed to save");
		}
		
		httpSession.removeAttribute("selectedSupplier");
		
		return mv;
	}
	
	//this controller is to update the supplier details
	@GetMapping("/supplier/edit")
	public ModelAndView editSupplier(@RequestParam int id) {
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
	public ModelAndView deleteSupplier(@RequestParam int id) {
		
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
