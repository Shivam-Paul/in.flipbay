package in.flipbay.testcase;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import in.flipbay.dao.CategoryDAO;
import in.flipbay.domain.Category;

@Component
@Repository
public class CategoryDAOTestCase {

	@Autowired
	private static CategoryDAO categoryDAO;
	
	@Autowired
	private static Category category;
	
	@Autowired
	private static AnnotationConfigApplicationContext context;
	
	@BeforeClass
	public static void init() {
		
		context = new AnnotationConfigApplicationContext();
		context.scan("in.flipbay");
		context.refresh();
		
		categoryDAO = (CategoryDAO)context.getBean("categoryDAO");
		
		category = (Category)context.getBean("category");
	}
	
	@Test
	public void saveCategoryTestCase() {
		
		category.setName("obj1");
		boolean status = categoryDAO.saveOrUpdate(category);
		assertEquals("save category test case", true, status);
	}
	
	@Test
	public void updateCategoryTestCase() {
		category.setName("test1");
		boolean status = categoryDAO.saveOrUpdate(category);
		assertEquals("update category test case", true, status);
		
	}
	
	@Test
	public void getCategorySuccessTestCase() {
		
		category = categoryDAO.get(02);
		
		assertNotNull("get category test case", category);
		
	}
	
	@Test
	public void getCategoryFailureTestCase() {
		
		category = categoryDAO.get(10010101);
		
		assertNull("get category test case", category);
		
	}
	
	@Test
	public void deleteCategorySuccessTestCase()
	{
	boolean status =	categoryDAO.delete(02);
	assertEquals("delete category succss test case" , true, status);
	
	}
	
	@Test
	public void deleteCategoryFailureTestCase()
	{
	boolean status =	categoryDAO.delete(1010101001);
	assertEquals("delete category failure test case" , false, status);
	
	}
	
	@Test
	public void getAllCategoryTestCase()
	{
	List<Category>	category = categoryDAO.list();
	
	assertEquals("get all category " , 1, category.size() );
	
	}
	

}
