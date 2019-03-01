package pe.com.DevSysIT.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import pe.com.DevSysITBackend.dao.UserDao;
import pe.com.DevSysITBackend.dto.Address;
import pe.com.DevSysITBackend.dto.Cart;
import pe.com.DevSysITBackend.dto.User;
import pe.com.DevSysIT.model.RegisterModel;

@Component
public class RegisterHandler {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	
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
		
		// encode the password
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		
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
