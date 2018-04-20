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
	public void saveProductTestCase() {
		
		product.setName("obj1");
		product.setDescription("test");
		boolean status = productDAO.save(product);
		assertEquals("save product test case", true, status);
	}
	
	@Test
	public void updateProductTestCase() {
		
		product.setName("obj1");
		product.setDescription("new");
		boolean status = productDAO.update(product);
		assertEquals("update product test case", true, status);
	}
	
	
	
	@Test
	public void getproductSuccessTestCase() {
		
		product = productDAO.get(02);
		
		assertNotNull("get product test case", product);
		
	}
	
	@Test
	public void getProductFailureTestCase() {
		
		product = productDAO.get(10101010);
		
		assertNull("get product test case", product);
		
	}
	
	@Test
	public void deleteProductSuccessTestCase()
	{
	boolean status =	productDAO.delete(02);
	assertEquals("delete product succss test case" , true, status);
	
	}
	
	@Test
	public void deleteProductFailureTestCase()
	{
	boolean status =	productDAO.delete(101010100);
	assertEquals("delete product failure test case" , false, status);
	
	}
	
	@Test
	public void getAllproductTestCase()
	{
	List<Product>	product = productDAO.list();
	
	assertEquals("get all product " , 1, product.size() );
	
	}

}
