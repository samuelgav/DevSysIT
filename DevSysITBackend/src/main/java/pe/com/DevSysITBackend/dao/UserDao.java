package pe.com.DevSysITBackend.dao;

import java.util.List;

import pe.com.DevSysITBackend.dto.Address;
import pe.com.DevSysITBackend.dto.Cart;
import pe.com.DevSysITBackend.dto.User;

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
