package in.flipbay.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="product")
public class Product implements Serializable{
	private static final long serialVersionUID = 1L;

	
	@Id	
	private int id;
	private String name;
	private String description;
	private String SupplierID;
	private String CategoryID;
	private Integer price;
	private int quantity;
	
	
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@ManyToOne
	@JoinColumn(name = "categoryID", updatable = false, insertable = false, nullable = false)
	private Category category;
	
	@ManyToOne
	@JoinColumn(name = "supplierID", updatable = false, insertable = false, nullable = false)
	private Supplier supplier;
	
	
	
	
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Supplier getSupplier() {
		return supplier;
	}
	public void setSupplier(Supplier supplier) {
		this.supplier = supplier;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSupplierID() {
		return SupplierID;
	}
	public void setSupplierID(String supplierID) {
		SupplierID = supplierID;
	}
	public String getCategoryID() {
		return CategoryID;
	}
	public void setCategoryID(String categoryID) {
		CategoryID = categoryID;
	}
	

}
