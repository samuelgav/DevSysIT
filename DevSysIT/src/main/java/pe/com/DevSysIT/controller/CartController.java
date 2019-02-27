package pe.com.DevSysIT.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import pe.com.DevSysIT.dao.CategoryDao;
import pe.com.DevSysIT.service.CartService;

@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private CartService cartService;
	
	
	@Autowired
	private CategoryDao categoryDAO;
	
	
	@RequestMapping("/show")
	public ModelAndView showCart() {
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("title", "User Cart");
		mv.addObject("cartLines", cartService.getCartLines());
		mv.addObject("categories", categoryDAO.list());
		mv.addObject("userClickShowCart", true);		
		return mv;
	}
}
