package pe.com.DevSysIT.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import pe.com.DevSysIT.dao.CartLineDao;
import pe.com.DevSysIT.dao.ProductDao;
import pe.com.DevSysIT.dao.UserDao;
import pe.com.DevSysIT.dto.Cart;
import pe.com.DevSysIT.dto.CartLine;
import pe.com.DevSysIT.dto.Product;
import pe.com.DevSysIT.dto.User;

public class CartLineTestCase {

	private static AnnotationConfigApplicationContext context;
	private static CartLineDao cartLineDao=null;
	private static ProductDao productDao=null;
	private static UserDao userDao=null;
	
	private Product product=null;
	private User user=null;
	private Cart cart=null;
	private CartLine cartLine=null;
	
	@BeforeClass
	public static void init() {
		context=new AnnotationConfigApplicationContext();
		context.scan("pe.com.DevSysIT");
		context.refresh();
		productDao=(ProductDao)context.getBean("productDAO");
		userDao=(UserDao)context.getBean("userDAO");
		cartLineDao=(CartLineDao)context.getBean("cartLineDAO");
	}
	
	@Test
	public void testAddNewCartLine() {
		// obtenemos el usuario
		user=userDao.getByEmail("gavidiamamani@gmail.com");
		// traemos el carrito
		cart=user.getCart();
		// obtenemos el producto
		product=productDao.get(1);
		// creamos la nueva linea de carro
		cartLine=new CartLine();
		cartLine.setBuyingPrice(product.getUnitPrice());
		cartLine.setProductCount(cartLine.getProductCount()+1);
		cartLine.setTotal(cartLine.getProductCount()*product.getUnitPrice());
		cartLine.setAvailable(true);
		cartLine.setCartId(cart.getId());
		cartLine.setProduct(product);
		assertEquals("Fallo al agregar line de carro",true, cartLineDao.add(cartLine));
		
		// actualizar el carro
		cart.setGrandTotal(cart.getGrandTotal()+cartLine.getTotal());
		cart.setCartLines(cart.getCartLines()+1);
		assertEquals("Fallo al actualizar el carro",true, cartLineDao.updateCart(cart));
		
	}
}
