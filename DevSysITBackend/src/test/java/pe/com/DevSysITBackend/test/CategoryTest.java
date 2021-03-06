package pe.com.DevSysITBackend.test;

import java.util.List;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import pe.com.DevSysITBackend.dao.CategoryDao;
import pe.com.DevSysITBackend.dto.Category;

public class CategoryTest {

	private static AnnotationConfigApplicationContext context;
	private static CategoryDao categoryDao;
	private static CategoryTest test;
	
	public static void main(String[] args) {
		context=new AnnotationConfigApplicationContext();
		context.scan("pe.com.DevSysITBackend");
		context.refresh();		
		categoryDao=(CategoryDao)context.getBean("categoryDAO");
		test=new CategoryTest();
		test.listCategory();
	}
	
	public void listCategory(){
		List<Category> list=categoryDao.list();
		for (Category category : list) {
			System.out.println("Id: "+category.getId()+" Nombre: "+category.getName());
		}
	}
	
}
