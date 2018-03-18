package in.flipbay.testcase;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import in.flipbay.dao.UserDAO;
import in.flipbay.domain.User;

@Component
@Repository
public class UserDAOTestCase {
	
	@Autowired
	private static UserDAO userDAO;
	
	@Autowired
	private static User user;
	
	@Autowired
	private static AnnotationConfigApplicationContext context;
	
	@BeforeClass
	public static void init() {
		
		context = new AnnotationConfigApplicationContext();
		context.scan("in.flipbay");
		context.refresh();
		
		userDAO = (UserDAO)context.getBean("userDAO");
		
		user = (User)context.getBean("user");
		
	}
	
	@Test
	public void saveUserTestCase() { 
		
		user.setEmailID("123@abcd.com");
		user.setName("test");
		user.setPwd("test");
		user.setMobile("9876543210");
		boolean status = userDAO.save(user);
		assertEquals("save user test case", true, status);
	}
	
	@Test
	public void updateUserTestCase() { 
		
		user.setEmailID("123@abcd.com");
		//user.setName("test");
		//user.setPwd("test");
		user.setMobile("1231231231");
		boolean status = userDAO.update(user);
		assertEquals("update user test case", true, status);
	}
	
	@Test
	public void getUserSuccessTestCase()
	{
		
	user= userDAO.get("123@abcd.com");
	
	assertNotNull("get user test case", user);
	}
	
	@Test
	public void getUserFailureTestCase()
	{
		
	user= userDAO.get("failure@gmail.com");
	
	assertNull("get user test case", user);
	}
	
	@Test
	public void deleteUserSuccessTestCase()
	{
	boolean status =	userDAO.delete("123@abcd.com");
	assertEquals("delete user succss test case" , true, status);
	
	}
	
	@Test
	public void deleteUserFailureTestCase()
	{
	boolean status =	userDAO.delete("failure@gmail.com");
	assertEquals("delete user failure test case" , false, status);
	
	}
	
	
	@Test
	public void getAllUsersTestCase()
	{
	List<User>	users = userDAO.list();
	
	assertEquals("get all users " , 1, users.size() );
	
	}
	@Test
	public void validateCredentailsTestCase()
	{
	user = 	userDAO.validate("123@abcd.com", "test");
	assertNotNull("Validate test case",user );
	
	}



}
