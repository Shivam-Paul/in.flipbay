package in.flipbay.dao;

import in.flipbay.domain.Address;

public interface AddressDAO {
	
	public Address get(String emailID);
	
	public boolean save(Address address);
	
	public boolean update(Address address);
	
	public boolean delete(Address address);
	

}
