package in.flipbay.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import in.flipbay.dao.CartItemDAO;
import in.flipbay.dao.CategoryDAO;
import in.flipbay.dao.UserDAO;
import in.flipbay.domain.Cart;
import in.flipbay.domain.CartItem;
import in.flipbay.domain.Category;
import in.flipbay.domain.User;
import in.flipbay.util.FileUtil;

//Annotation
@Controller
public class UserController {
	
	@Autowired	private UserDAO userDAO;
	
	@Autowired	private User user;
	
	@Autowired	private HttpSession httpSession;
	
	@Autowired  private CategoryDAO categoryDAO;
	
	@Autowired	private CartItemDAO cartItemDAO;
	
	@Autowired	private Cart cart;
	
	@Autowired  private CartItem cartItem;
	
	@Autowired
	private FileUtil fileUtil;
		
	
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
			httpSession.setAttribute("welcomeMessage", user.getName());
			httpSession.setAttribute("loggedInUserID", user.getEmailID());
			httpSession.setAttribute("userLoggedIn", true);
			List<CartItem> myCart = cartItemDAO.list(cartItem.getCartID());
			httpSession.setAttribute("cartSize", myCart.size());
			cart = cartItemDAO.getCart(username);
			httpSession.setAttribute("userCartID", cart.getId());
			
			if(user.getRole()=='A')
			{
				httpSession.setAttribute("isAdmin", true);
			}
			else {
				httpSession.setAttribute("isAdmin", false);
			}
		}
		mv.addObject("isUserClickedHome",true);

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
	
	
	
	//This method is used for user registration
	@PostMapping("/register")
	public ModelAndView saveUser(@RequestParam("emailID") String emailID, @RequestParam("name") String name,
			@RequestParam("password") String password,@RequestParam("mobile") String mobile,
			@RequestParam("securityQuestion") String securityQuestion,@RequestParam("securityAnswer") String securityAnswer)  {
		
		ModelAndView mv = new ModelAndView("redirect:/registration");
		System.out.println(emailID);
		user.setEmailID(emailID);
		System.out.println(emailID);
		user.setName(name);
		user.setPwd(password);
		user.setMobile(mobile);
		user.setSecurityQuestion(securityQuestion);
		user.setSecurityAnswer(securityAnswer);
		
		
		if(userDAO.save(user) == true) { 
			cart.setGrandTotal(0.0);
			cart.setCartItem(0);
			cart.setEmailID(emailID);
			
			cartItemDAO.addCart(cart);

			mv.addObject("successMessage","The user saved successfully");	
			mv.addObject("redirectToLogin",true);
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
	
	@GetMapping("user/getAll")
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
	
	@PostMapping("user/securityQues")
	public ModelAndView getSecurityQues(@RequestParam("emailID") String id) {
		
		ModelAndView mv = new ModelAndView("home");
		user = userDAO.get(id);
		httpSession.setAttribute("forgotPasswordUser", user);
		mv.addObject("securityQuestion" ,user.getSecurityQuestion());
		mv.addObject("isUserClickedSecurityQues", true);
		return mv;
	}
	
	@PostMapping("user/checkQues")
	public ModelAndView checkSecurityQues(@RequestParam("SecurityAnswer") String SecurityAnswer) {
		
		ModelAndView mv = new ModelAndView("home");
		user = (User)httpSession.getAttribute("forgotPasswordUser");
		String dbSecAnswer = user.getSecurityAnswer();
		
		if(dbSecAnswer.equals(SecurityAnswer)) {
			mv.addObject("validSecurityAnswer", true);
			mv.addObject("isUserClickedChangePassword", true);
		}
		else {
		mv.addObject("invalidSecurityAnswer", "Invalid Security Answer");
		}
		return mv;
	}
	
	@PostMapping("user/changePassword")
	public ModelAndView changePassword(@RequestParam("NewPassword") String newPassword) {
		
		ModelAndView mv = new ModelAndView("redirect:/");
		
		user = (User)httpSession.getAttribute("forgotPasswordUser");
		user.setEmailID(user.getEmailID());
		user.setPwd(newPassword);
		user.setName(user.getName());
		user.setMobile(user.getMobile());
		user.setRegisteredDate(user.getRegisteredDate());
		user.setSecurityQuestion(user.getSecurityQuestion());
		user.setSecurityAnswer(user.getSecurityAnswer());
		user.setRole(user.getRole());
		userDAO.update(user);
		
		
		mv.addObject("passwordChanged", "Your Password has been updated successfully");
		
		return mv;
	}
	  
	  @GetMapping("/logout")
	  public ModelAndView logout() {
		  
		  ModelAndView mv = new ModelAndView("home");
		  mv.addObject("isUserClickedLogout", true);
		  httpSession.invalidate();
		  List<Category> allCategories = categoryDAO.list();
			
			httpSession.setAttribute("allCategories", allCategories);
		  
		  user = null;
		  mv.addObject("isUserClickedHome",true);
		  
		  httpSession.setAttribute("userLoggedIn", false);
		  
		  return mv;
		  
	  }
	  
	 @GetMapping("/editProfile")
	 public ModelAndView editProfile() {
		 
		 ModelAndView mv = new ModelAndView("home");
		 String userId = (String)httpSession.getAttribute("loggedInUserID");
		 user = userDAO.get(userId);
		 httpSession.setAttribute("userDetails", user);
		 mv.addObject("isUserClickedEditProfile", true);
		 return mv;
	 }
	 
	 @PostMapping("/changeProfile")
	 public ModelAndView changeProfile(@RequestParam("name") String name,@RequestParam("mobile") String mobile,
				@RequestParam("securityQuestion") String securityQuestion,@RequestParam("securityAnswer") String securityAnswer,
				 @RequestParam("file") MultipartFile file) {
		 
		 ModelAndView mv = new ModelAndView("home");
		 
		 user.setName(name);
		 user.setMobile(mobile);
		 user.setSecurityQuestion(securityQuestion);
		 user.setSecurityAnswer(securityAnswer);
		 
		 String userImagesDirectory = ((String)httpSession.getAttribute("baseImageDirectory"))+"users\\";
			httpSession.setAttribute("userImagesDirectory", userImagesDirectory);
			mv.addObject("saveProductSuccessMessage","The product saved successfully");	
			if(fileUtil.fileCopyNIO(file, user.getEmailID() + ".png", userImagesDirectory)) {
				
				mv.addObject("fileUploadSuccessMessage", "File uploaded Successfully");
			}
			else {
				
				mv.addObject("fileUploadErrorMessage", "File failed to upload");
			}
		 
		 if(userDAO.update(user)) {
			 mv.addObject("editProfileSuccessMessage", "Profile edited Successfully");
		 }
		 
		 else {
			 mv.addObject("editProfileErrorMessage", "The profile could not be edited");
		 }
		 return mv;
		 
	 }
	 
	 @GetMapping("/user/edit")
		public ModelAndView editUser(@RequestParam String emailID) {
			List<User> allUsers = userDAO.list();
			httpSession.setAttribute("allUsers", allUsers);
			ModelAndView mv = new ModelAndView("redirect:/user");
			mv.addObject("isAdminClickedEditUsers",true);
			user = userDAO.get(emailID);
			httpSession.setAttribute("selectedUser", user);
			return mv;
		}
	 
	 @GetMapping("/user/delete")
		public ModelAndView deleteCategory(@RequestParam String emailID) {
			
			ModelAndView mv = new ModelAndView("redirect:/user");
			if (userDAO.delete(emailID) == true) {
				List<User> allUsers = userDAO.list();
				httpSession.setAttribute("allUsers", allUsers);
				mv.addObject("successMessage", "The user deleted successfully");
			} else {
				mv.addObject("errorMessage", "Could not delete the user.");
			}
			return mv;
		}
	 
	

	  
}








