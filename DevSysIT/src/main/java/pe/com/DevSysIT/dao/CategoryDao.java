package pe.com.DevSysIT.dao;

import java.util.List;

import pe.com.DevSysIT.dto.Category;

public interface CategoryDao {
	
	List<Category> list();
	Category get(int id);
	boolean add(Category category);
	boolean update(Category category);
	boolean delete(Category category);
	
	
	
}
