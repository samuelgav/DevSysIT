package pe.com.DevSysIT.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import pe.com.DevSysIT.dao.CartLineDao;
import pe.com.DevSysIT.dto.Cart;
import pe.com.DevSysIT.dto.CartLine;
import pe.com.DevSysIT.dto.Product;
import pe.com.DevSysIT.model.UserModel;

@Service("cartService")
public class CartService {

	@Autowired
	private CartLineDao cartLineDao;
	
	@Autowired
	private HttpSession session;
	
	private Cart getCart() {
		return ((UserModel) session.getAttribute("userModel")).getCart();
	}
	
	public List<CartLine> getCartLines(){
		return cartLineDao.list(this.getCart().getId());
	}

	public String updateCartLine(int cartLineId, int count) {
		CartLine cartLine=cartLineDao.get(cartLineId);
		if(cartLine ==null) {
			return "result=error";
		}else {
			Product product=cartLine.getProduct();
			double 	oldTotal=cartLine.getTotal();
			if(product.getQuantity() <=count) {
				count=product.getQuantity();
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
	
	
	
}
