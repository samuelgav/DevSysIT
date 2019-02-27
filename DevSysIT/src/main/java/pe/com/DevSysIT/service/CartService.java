package pe.com.DevSysIT.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import pe.com.DevSysIT.dao.CartLineDao;
import pe.com.DevSysIT.dto.Cart;
import pe.com.DevSysIT.dto.CartLine;
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
	
	
	
}
