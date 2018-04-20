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
public class Cart implements Serializable {
	
	private static final long serialVersionUID = 1L;

	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)	
	private int id;
	
	private String emailID;
	
	@OneToOne
	@JoinColumn(name = "emailID", updatable = false, insertable = false, nullable = false)
	private User user;
		
	private double grandTotal;
	
	private int cartItem;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmailID() {
		return emailID;
	}

	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public double getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}

	public int getCartItem() {
		return cartItem;
	}

	public void setCartItem(int cartItem) {
		this.cartItem = cartItem;
	}
	
	
	
	
	

	
	
}
