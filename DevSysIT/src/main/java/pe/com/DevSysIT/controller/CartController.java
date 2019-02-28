package pe.com.DevSysIT.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public ModelAndView showCart(@RequestParam(name="result",required=false)String result) {
		ModelAndView mv=new ModelAndView("page");
		
		if(result !=null) {
			switch (result) {
			case "updated":
				mv.addObject("message", "Linea de carrito fue actualizado correctamente");
				break;
			case "deleted":
				mv.addObject("message", "Linea de carrito fue removido correctamente");
				break;
			case "error":
				mv.addObject("message", "Ocurrio un problema!");
				break;
			default:
				break;
			}
		}
		
		mv.addObject("title", "User Cart");
		mv.addObject("cartLines", cartService.getCartLines());
		mv.addObject("categories", categoryDAO.list());
		mv.addObject("userClickShowCart", true);		
		return mv;
	}
	
	@RequestMapping("/{cartLineId}/update")
	public String updateCart(@PathVariable int cartLineId, @RequestParam int count) {
		String response=cartService.updateCartLine(cartLineId,count);
		return "redirect:/cart/show?"+response;		
	}
	
	
	@RequestMapping("/{cartLineId}/delete")
	public String deleteCart(@PathVariable int cartLineId) {
		String response=cartService.deleteCartLine(cartLineId);
		return "redirect:/cart/show?"+response;		
	}
	
	
}
