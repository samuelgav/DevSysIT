package pe.com.DevSysIT.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import pe.com.DevSysITBackend.dao.CartLineDao;
import pe.com.DevSysITBackend.dao.ProductDao;
import pe.com.DevSysITBackend.dto.Cart;
import pe.com.DevSysITBackend.dto.CartLine;
import pe.com.DevSysITBackend.dto.Product;
import pe.com.DevSysIT.model.UserModel;

@Service("cartService")
public class CartService {

	@Autowired
	private CartLineDao cartLineDao;
	
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private HttpSession session;
	
	private Cart getCart() {
		return ((UserModel) session.getAttribute("userModel")).getCart();
	}
	
	public List<CartLine> getCartLines(){
		return cartLineDao.list(this.getCart().getId());
	}

	public String manageCartLine(int cartLineId, int count) {
		CartLine cartLine=cartLineDao.get(cartLineId);
		if(cartLine ==null) {
			return "result=error";
		}else {
			Product product=cartLine.getProduct();
			double 	oldTotal=cartLine.getTotal();
			
			if(product.getQuantity() < count) {
				return "result=unavailable";
			}
			
			cartLine.setProductCount(count);
			cartLine.setBuyingPrice(product.getUnitPrice());
			cartLine.setTotal(product.getUnitPrice()*count);
			cartLineDao.update(cartLine);
			Cart cart=this.getCart();
			cart.setGrandTotal(cart.getGrandTotal()-oldTotal + cartLine.getTotal());
			cartLineDao.updateCart(cart);
			return "result=updated";
		}
		
	}

	public String deleteCartLine(int cartLineId) {
		// TODO Auto-generated method stub
		CartLine cartLine=cartLineDao.get(cartLineId);
		if(cartLine ==null) {
			return "result=error";
		}else {
			Cart cart=this.getCart();
			cart.setGrandTotal(cart.getGrandTotal()- cartLine.getTotal());
			cart.setCartLines(cart.getCartLines()-1);
			cartLineDao.updateCart(cart);
			
			cartLineDao.remove(cartLine);
			return "result=deleted";
		}
		
	}

	public String addCartLine(int productId) {
		// TODO Auto-generated method stub
		String response=null;
		Cart cart=this.getCart();
		CartLine cartLine=cartLineDao.getByCartAndProduct(cart.getId(), productId);
		if(cartLine == null) {
			cartLine=new CartLine();
			Product producto=productDao.get(productId);
			cartLine.setCartId(cart.getId());
			cartLine.setProduct(producto);
			cartLine.setBuyingPrice(producto.getUnitPrice());
			cartLine.setProductCount(1);
			cartLine.setTotal(producto.getUnitPrice());
			cartLine.setAvailable(true);
			
			cartLineDao.add(cartLine);
			
			cart.setCartLines(cart.getCartLines()+1);
			cart.setGrandTotal(cart.getGrandTotal()+cartLine.getTotal());
			cartLineDao.updateCart(cart);
			response="result=added";
			
		}else {
			if(cartLine.getProductCount()<3) {
				response=this.manageCartLine(cartLine.getId(), cartLine.getProductCount()+1);
			}else {
				response="result=maximum";
			}
		}
		return response;
	}
	
	
	
}
