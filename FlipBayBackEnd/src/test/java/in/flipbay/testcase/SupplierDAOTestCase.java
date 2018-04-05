package in.flipbay.testcase;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import in.flipbay.dao.SupplierDAO;
import in.flipbay.domain.Supplier;

public class SupplierDAOTestCase {

	@Autowired
	private static SupplierDAO supplierDAO;
	
	@Autowired
	private static Supplier supplier;
	
	@Autowired
	private static AnnotationConfigApplicationContext context;
	
	@BeforeClass
	public static void init() {
		
		context = new AnnotationConfigApplicationContext();
		context.scan("in.flipbay");
		context.refresh();
		
		supplierDAO = (SupplierDAO)context.getBean("supplierDAO");
		
		supplier = (Supplier)context.getBean("supplier");
	}
	
	@Test
	public void savesupplierTestCase() {
		
		supplier.setName("obj1");
		boolean status = supplierDAO.saveOrUpdate(supplier);
		assertEquals("save supplier test case", true, status);
	}
	
	@Test
	public void updatesupplierTestCase() {
		
		supplier.setName("test1");
		boolean status = supplierDAO.saveOrUpdate(supplier);
		assertEquals("update category test case", true, status);
		
	}
	
	@Test
	public void getsupplierSuccessTestCase() {
		
		supplier = supplierDAO.get(02);
		
		assertNotNull("get supplier test case", supplier);
		
	}
	
	@Test
	public void getsupplierFailureTestCase() {
		
		supplier = supplierDAO.get(1010100101);
		
		assertNull("get supplier test case", supplier);
		
	}
	
	@Test
	public void deletesupplierSuccessTestCase()
	{
	boolean status =	supplierDAO.delete(02);
	assertEquals("delete supplier succss test case" , true, status);
	
	}
	
	@Test
	public void deletesupplierFailureTestCase()
	{
	boolean status =	supplierDAO.delete(1010101001);
	assertEquals("delete supplier failure test case" , false, status);
	
	}
	
	@Test
	public void getAllsupplierTestCase()
	{
	List<Supplier>	supplier = supplierDAO.list();
	
	assertEquals("get all supplier " , 1, supplier.size() );
	
	}

}
