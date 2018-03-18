//package in.flipbay.testcase;
//
//import static org.junit.Assert.*;
//
//import org.junit.BeforeClass;
//import org.junit.Test;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.AnnotationConfigApplicationContext;
//
//import in.flipbay.domain.User;
//import in.flipbay.dao.UserDAO;
//
//
//public class UserTestCase {
//
//	
//	
//	@Autowired
//	private static AnnotationConfigApplicationContext context;
//	
//	@Autowired
//	private static User user;
//	
//	@Autowired
//	private static UserDAO userDAO;
//	
//	
//	@BeforeClass
//	public static void initialize()
//	{
//		
//		context = new AnnotationConfigApplicationContext();
//		context.scan("in.flipbay");
//		context.refresh();
//		
//		user = (User)context.getBean("user");
//		userDAO = (UserDAO)context.getBean("userDAO");
//		
//	}
//	
//	
//	@Test
//	public void validateCredentialsTestCase()
//	{
//		
//	  boolean flag	= userDAO.validate("niit", "niitt");
//	  
//	  assertEquals("validateCredentialsTestCase " , true,flag );
//	  
//	  System.out.println("Success");
//		
//	}
//	
//	
//	
//	
//}
//
//
//
//
//
//
//
//
//
//
//
