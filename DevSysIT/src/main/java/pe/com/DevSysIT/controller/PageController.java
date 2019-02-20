package pe.com.DevSysIT.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pe.com.DevSysIT.dao.CategoryDao;
import pe.com.DevSysIT.dao.ProductDao;
import pe.com.DevSysIT.dto.Category;
import pe.com.DevSysIT.dto.Product;
import pe.com.DevSysIT.exception.ProductNotFoundException;



@Controller
public class PageController {

	//private static final Logger logger = LoggerFactory.getLogger(PageController.class);
	
	@Autowired
	private CategoryDao categoryDAO;
	
	@Autowired
	private ProductDao productDAO;
	
	@RequestMapping(value= {"/","/index","/home"})
	public ModelAndView index() {
		ModelAndView mv=new ModelAndView("page");
		mv.addObject("title","Home");
		mv.addObject("categories", categoryDAO.list());
		mv.addObject("userClickHome", true);		
		return mv;
	}
	
	@RequestMapping(value = "/about")
	public ModelAndView about() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","About Us");
		mv.addObject("categories", categoryDAO.list());
		mv.addObject("userClickAbout",true);		
		return mv;				
	}	
	
	@RequestMapping(value = "/contact")
	public ModelAndView contact() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","Contact Us");
		//passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		mv.addObject("userClickContact",true);		
		return mv;				
	}
	
	
	@RequestMapping(value = "/show/all/products")
	public ModelAndView showAllProducts() {		
		ModelAndView mv = new ModelAndView("page");		
		mv.addObject("title","All Products");		
		//passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		mv.addObject("userClickAllProducts",true);		
		return mv;				
	}	
	
	@RequestMapping(value = "/show/category/{id}/products")
	public ModelAndView showCategoryProducts(@PathVariable("id") int id) {		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title","Product by Category");
		// categoryDAO to fetch a single category
		Category category = null;
		category = categoryDAO.get(id);
		//mv.addObject("title",category.getName());
		//passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		// passing the single category object
		mv.addObject("category", category);
		mv.addObject("userClickCategoryProducts",true);
		return mv;				
	}

	
	@RequestMapping(value = "/show/{id}/product") 
	public ModelAndView showSingleProduct(@PathVariable int id) throws ProductNotFoundException {
		ModelAndView mv = new ModelAndView("page");		
		Product product = productDAO.get(id);		
		if(product == null) throw new ProductNotFoundException();		
		// update the view count
		product.setViews(product.getViews() + 1);
		productDAO.update(product);		
		mv.addObject("title", product.getName());
		//passing the list of categories
		mv.addObject("categories", categoryDAO.list());
		mv.addObject("product", product);		
		mv.addObject("userClickShowProduct", true);		
		return mv;		
	}
	
	
	@RequestMapping(value="/login")
	public ModelAndView login() {
		ModelAndView mv= new ModelAndView("login");
		mv.addObject("title", "Login");
		return mv;
	}
	
	
}
