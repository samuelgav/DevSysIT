package pe.com.DevSysIT.exception;

import java.io.Serializable;

public class CategoryNotFoundException extends Exception implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String message;

	public CategoryNotFoundException() {
		this("Categoria no existe");
	}

	public CategoryNotFoundException(String message) {
		this.message = System.currentTimeMillis() + ": " + message;
	}

	public String getMessage() {
		return message;
	}
	
	
	
	

}
