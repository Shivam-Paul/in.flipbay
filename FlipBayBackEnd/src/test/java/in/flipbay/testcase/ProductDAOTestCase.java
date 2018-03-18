package in.flipbay.testcase;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import in.flipbay.dao.ProductDAO;
import in.flipbay.domain.Product;

public class ProductDAOTestCase {

	@Autowired
	private static ProductDAO productDAO;
	
	@Autowired
	private static Product product;
	
	@Autowired
	private static AnnotationConfigApplicationContext context;
	
	@BeforeClass
	public static void init() {
		
		context = new AnnotationConfigApplicationContext();
		context.scan("in.flipbay");
		context.refresh();
		
		productDAO = (ProductDAO)context.getBean("productDAO");
		
		product = (Product)context.getBean("product");
	}
	
	@Test
	public void saveproductTestCase() {
		
		product.setID("ID01");
		product.setName("obj1");
		boolean status = productDAO.save(product);
		assertEquals("save product test case", true, status);
	}
	
	@Test
	public void updateproductTestCase() {
		
		Product product=productDAO.get("ID01");
		product.setID("ID01");
		product.setName("test1");
		product.setDescription(product.getDescription());
		boolean status = productDAO.update(product);
		assertEquals("update category test case", true, status);
		
	}
	
	@Test
	public void getproductSuccessTestCase() {
		
		product = productDAO.get("ID01");
		
		assertNotNull("get product test case", product);
		
	}
	
	@Test
	public void getproductFailureTestCase() {
		
		product = productDAO.get("Fail");
		
		assertNull("get product test case", product);
		
	}
	
	@Test
	public void deleteproductSuccessTestCase()
	{
	boolean status =	productDAO.delete("ID01");
	assertEquals("delete product succss test case" , true, status);
	
	}
	
	@Test
	public void deleteproductFailureTestCase()
	{
	boolean status =	productDAO.delete("Fail");
	assertEquals("delete product failure test case" , false, status);
	
	}
	
	@Test
	public void getAllproductTestCase()
	{
	List<Product>	product = productDAO.list();
	
	assertEquals("get all product " , 1, product.size() );
	
	}

}
