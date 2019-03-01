package pe.com.DevSysITBackend.dao;

import java.util.List;

import pe.com.DevSysITBackend.dto.Category;

public interface CategoryDao {
	
	List<Category> list();
	Category get(int id);
	boolean add(Category category);
	boolean update(Category category);
	boolean delete(Category category);
	
	
	
}
