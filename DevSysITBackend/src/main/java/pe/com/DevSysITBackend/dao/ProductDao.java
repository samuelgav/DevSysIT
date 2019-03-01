package pe.com.DevSysITBackend.dao;

import java.util.List;

import pe.com.DevSysITBackend.dto.Product;

public interface ProductDao {
	
	Product get(int productId);
	List<Product> list();
	
	boolean add(Product product);	
	boolean update(Product product);
	boolean delete(Product product);
	
	List<Product> getProductsByParam(String param, int count);
	
	List<Product> listActiveProducts();	
	List<Product> listActiveProductsByCategory(int categoryId);

}
