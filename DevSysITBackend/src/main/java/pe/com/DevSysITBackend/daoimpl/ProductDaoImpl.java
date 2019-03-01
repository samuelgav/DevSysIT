package pe.com.DevSysITBackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pe.com.DevSysITBackend.dao.ProductDao;
import pe.com.DevSysITBackend.dto.Product;

@Repository("productDAO")
@Transactional
public class ProductDaoImpl implements ProductDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Product> list() {
		// TODO Auto-generated method stub
		return sessionFactory.getCurrentSession().createQuery("FROM Product",Product.class).getResultList();
	}

	@Override
	public boolean add(Product product) {
		try {
			sessionFactory.getCurrentSession().persist(product);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public Product get(int productId) {		
		try {			
			return sessionFactory
					.getCurrentSession()
						.get(Product.class,Integer.valueOf(productId));			
		}
		catch(Exception ex) {		
			ex.printStackTrace();			
		}
		return null;
	}

	@Override
	public boolean update(Product product) {
		try {
			sessionFactory.getCurrentSession().update(product);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean delete(Product product) {
		try {
			sessionFactory.getCurrentSession().delete(product);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Product> listActiveProducts() {
		String selectActiveProducts = "FROM Product WHERE active = :active";
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectActiveProducts, Product.class)
						.setParameter("active", true)
							.getResultList();
	}

	@Override
	public List<Product> listActiveProductsByCategory(int categoryId) {
		String selectActiveProductsByCategory = "FROM Product WHERE active = :active AND categoryId = :categoryId";
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectActiveProductsByCategory, Product.class)
						.setParameter("active", true)
						.setParameter("categoryId",categoryId)
							.getResultList();
	}
	
	@Override
	public List<Product> getProductsByParam(String param, int count) {
		String query = "FROM Product WHERE active = true ORDER BY " + param + " DESC";
		return sessionFactory
					.getCurrentSession()
					.createQuery(query,Product.class)
					.setFirstResult(0)
					.setMaxResults(count)
					.getResultList();
	}

}
