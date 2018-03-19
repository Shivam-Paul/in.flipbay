package in.flipbay.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import in.flipbay.dao.UserDAO;
import in.flipbay.domain.User;

//Annotation
@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDAO;
	
	@Autowired
	private User user;
	
	
	//will send user id and password from jsp to controller
	//it should validate the credentials
	//it should return username ---- valid credentials
	//it should return error message ----invalid credentials
	
	@PostMapping("validate")
	public ModelAndView validate(@RequestParam("uname") String username, @RequestParam("psw") String password)
	
	{
		ModelAndView mv = new ModelAndView("home");
		user = userDAO.validate(username, password);
		if(user == null)
		{
			mv.addObject("errorMessage" , "Invalid credentials..please try again.");
		}
		else
		{
			mv.addObject("welcomeMessage", "Welcome : " +user.getName());
			
			if(user.getRole()=='A')
			{
				mv.addObject("isAdmin", true);
			}
		}
		return mv;
	}
	
	@DeleteMapping("/user/delete/{emailid}")
	public ModelAndView deleteUser(@RequestParam("id") String emailid) {
		ModelAndView mv = new ModelAndView("home");
		if (userDAO.delete(emailid) == true) {
			mv.addObject("successMessage", "The user deleted successfully");
		} else {
			mv.addObject("errorMessage", "Could not delete the user.");
		}
		return mv;
	}
	
	@PutMapping("/user/update")
	public ModelAndView updateUser(@RequestBody User user) {
		ModelAndView mv = new ModelAndView("home");
		if (userDAO.update(user) == true) {
			mv.addObject("successMessage", "The user updated successfully");
		} else {
			mv.addObject("errorMessage", "Could not update the user.");
		}
		return mv;
	}
	
	//This method is used for user registration
	@PostMapping("/user/save")
	public ModelAndView saveUser(@RequestBody User user)  {
		ModelAndView mv = new ModelAndView();
		if(userDAO.save(user) == true) { 	
			mv.addObject("successMessage","The user saved successfully");	
		}
		else {	
			mv.addObject("failureMessage", "The user failed to save");
		}
		return mv;
	}
	
	@GetMapping("/user/get/{emailid}")
	public ModelAndView getUser(@RequestParam("id") String emailid) {
		
		ModelAndView mv = new ModelAndView();
		User user=userDAO.get(emailid);
		mv.addObject("user", user);
		return mv;
	}
	
	@GetMapping("/user/getAll")
	public ModelAndView getAllUsers() {
		
		ModelAndView mv = new ModelAndView();
		List<User> allUsers = userDAO.list();
		mv.addObject("allUsers", allUsers);
		return mv;
	}
	
	@GetMapping("user/forgotPassword") 
	public ModelAndView getForgotPassword()
	{
		
		ModelAndView mv=new ModelAndView("home");
		mv.addObject("isUserClickedForgotPassword", true);
		return mv;
	}
	
	@PostMapping("/user/securityQues")
	public ModelAndView getForgotPass(@RequestParam("uname") String id) {
		
		ModelAndView mv = new ModelAndView("home");
		User user = userDAO.get(id);
		mv.addObject(" securityQuestion" ,user.getSecurityQuestion());
		mv.addObject("isUserClickedSecurityQues", true);
		return mv;
	}
	
	
//	@GetMapping("/register") 
//	public String register(Model model) { 
//	    model.addAttribute("user", user); 
//	    return "login"; 
//	}
	  
	  @PostMapping("/registerProcess")
	  public ModelAndView addUser(HttpServletRequest request, HttpServletResponse response,
	  @ModelAttribute("user") User user) {
	  userDAO.register(user);
	  return new ModelAndView("welcome", "Name", user.getName());
	  }
}








