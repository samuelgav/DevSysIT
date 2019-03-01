package pe.com.DevSysITBackend.dao;

import java.util.List;

import pe.com.DevSysITBackend.dto.Cart;
import pe.com.DevSysITBackend.dto.CartLine;

public interface CartLineDao {

	public CartLine get(int id);
	public boolean add(CartLine cartLine);
	public boolean update(CartLine cartLine);
	public boolean remove(CartLine cartLine);
	public List<CartLine> list(int cartId);
		
	// list of available cartLine
	public List<CartLine> listAvailable(int cartId);
	
	// fetch the CartLine based on cartId and productId
	public CartLine getByCartAndProduct(int cartId, int productId);		
	
		
	// updating the cart
	boolean updateCart(Cart cart);
	
	
	// adding order details
	//boolean addOrderDetail(OrderDetail orderDetail);

	
}
