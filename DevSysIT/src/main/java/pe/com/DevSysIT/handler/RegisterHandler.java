package pe.com.DevSysIT.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

import pe.com.DevSysIT.dao.UserDao;
import pe.com.DevSysIT.dto.Address;
import pe.com.DevSysIT.dto.Cart;
import pe.com.DevSysIT.dto.User;
import pe.com.DevSysIT.model.RegisterModel;

@Component
public class RegisterHandler {

	@Autowired
	private UserDao userDao;
	
	
	public RegisterModel init() {
		return new RegisterModel();
	}
	
	
	public void addUser(RegisterModel registerModel, User user) {
		registerModel.setUser(user);
	}
	
	public void addBilling(RegisterModel registerModel, Address billing) {
		registerModel.setBilling(billing);
	}
	
	public String validateUser(User user, MessageContext error) {
		String transitionValue="success";
		if(!user.getPassword().equals(user.getConfirmPassword())) {
		    error.addMessage(new MessageBuilder().error().source(
		      "confirmPassword").defaultText("Password does not match confirm password!").build());
		    transitionValue = "failure";    
		   }  
		   if(userDao.getByEmail(user.getEmail())!=null) {
		    error.addMessage(new MessageBuilder().error().source(
		      "email").defaultText("Email address is already taken!").build());
		    transitionValue = "failure";
		   }
		
		return transitionValue;
	}
	
	
	public String saveAll(RegisterModel registerModel) {
		String transitionValue="success";
		//fetch user
		User user=registerModel.getUser();
		if(user.getRole().equals("USER")) {
			Cart cart=new Cart();
			cart.setUser(user);
			user.setCart(cart);
		}
		
		//guardar usuario
		userDao.add(user);
		
		//fetch address
		Address billing=registerModel.getBilling();
		billing.setUserId(user.getId());
		billing.setBilling(true);
		
		//guardar direccion
		userDao.addAddress(billing);
		
				
		return transitionValue;
	}
	
	
}
