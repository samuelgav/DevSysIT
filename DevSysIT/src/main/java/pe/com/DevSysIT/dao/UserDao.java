package pe.com.DevSysIT.dao;

import java.util.List;

import pe.com.DevSysIT.dto.Address;
import pe.com.DevSysIT.dto.Cart;
import pe.com.DevSysIT.dto.User;

public interface UserDao {
	
	User getByEmail(String email);
	User get(int id);
	
	boolean add(User user);
	
	//Address getAddress(int addressId);
	boolean addAddress(Address address);
	//boolean updateAddress(Address address);
	Address getBillingAddress(int userId);	
	List<Address> listShippingAddresses(int userId);
	
	
	boolean addCart(Cart cart);
	
}
