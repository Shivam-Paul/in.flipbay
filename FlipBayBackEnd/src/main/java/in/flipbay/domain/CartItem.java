package in.flipbay.domain;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table
public class CartItem implements Serializable{
	
	private static final long serialVersionUID = 1L;

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private int cartItemID;
	
	private int cartID;
	
	private int productID;
	
	private String productName;
	
	private int avlQuantity;
	
	
	
	
	public int getAvlQuantity() {
		return avlQuantity;
	}

	public void setAvlQuantity(int avlQuantity) {
		this.avlQuantity = avlQuantity;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@OneToOne
	@JoinColumn(name = "productID", updatable = false, insertable = false, nullable = false)
	private Product product;
	
	private int quantity;
	
	private double subTotal;
	
	private int price;

	public int getCartItemID() {
		return cartItemID;
	}

	public void setCartItemID(int cartItemID) {
		this.cartItemID = cartItemID;
	}

	public int getCartID() {
		return cartID;
	}

	public void setCartID(int cartID) {
		this.cartID = cartID;
	}
	

	public int getProductID() {
		return productID;
	}

	public void setProductID(int productID) {
		this.productID = productID;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getSubTotal() {
		return subTotal;
	}

	public void setSubTotal(double subTotal) {
		this.subTotal = subTotal;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	

	
	
	
	

}
