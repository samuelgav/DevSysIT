package pe.com.DevSysIT.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import pe.com.DevSysITBackend.dao.UserDao;
import pe.com.DevSysITBackend.dto.User;
import pe.com.DevSysIT.model.UserModel;

@ControllerAdvice
public class GlobalController {

	@Autowired
	private HttpSession session;

	@Autowired
	private UserDao userDao;

	private UserModel userModel = null;
	
	private User user = null;	

	@ModelAttribute("userModel")
	public UserModel getUserModel() {

		if (session.getAttribute("userModel") == null) {
			// agregamos el modelo de usuario
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			user = userDao.getByEmail(authentication.getName());
			if (user != null) {
				// creamos un nuevo usuario
				userModel = new UserModel();
				userModel.setId(user.getId());
				userModel.setEmail(user.getEmail());
				userModel.setRole(user.getRole());
				userModel.setFullName(user.getFirstName() + " " + user.getLastName());

				if (userModel.getRole().equals("USER")) {
					userModel.setCart(user.getCart());
				}

				session.setAttribute("userModel", userModel);
				return userModel;
			}
		}
		return (UserModel) session.getAttribute("userModel");
	}

}
