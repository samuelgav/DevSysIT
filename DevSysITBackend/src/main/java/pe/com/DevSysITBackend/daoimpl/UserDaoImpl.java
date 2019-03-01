package pe.com.DevSysITBackend.daoimpl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import pe.com.DevSysITBackend.dao.UserDao;
import pe.com.DevSysITBackend.dto.Address;
import pe.com.DevSysITBackend.dto.Cart;
import pe.com.DevSysITBackend.dto.User;

@Repository("userDAO")
@Transactional
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public User getByEmail(String email) {
		String sql="FROM User WHERE email =:email";
		try {
			return sessionFactory.getCurrentSession()
					.createQuery(sql,User.class).setParameter("email",email).getSingleResult();
		} catch (Exception e) {
			//e.printStackTrace();
			return null;
		}
	}
	
	
	
	@Override
	public boolean add(User user) {
		try {
			sessionFactory.getCurrentSession().persist(user);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean addAddress(Address address) {
		try {			
			// will look for this code later and why we need to change it
			sessionFactory.getCurrentSession().persist(address);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}

	@Override
	public boolean addCart(Cart cart) {
		try {
			sessionFactory.getCurrentSession().persist(cart);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	

	@Override
	public Address getBillingAddress(int userId) {
		String selectQuery = "FROM Address WHERE userId = :userId AND billing = :isBilling";
		try{
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectQuery,Address.class)
						.setParameter("userId", userId)
						.setParameter("isBilling", true)
						.getSingleResult();
		}
		catch(Exception ex) {
			return null;
		}
	}

	@Override
	public List<Address> listShippingAddresses(int userId) {
		String selectQuery = "FROM Address WHERE userId = :userId AND shipping = :isShipping ORDER BY id DESC";
		return sessionFactory
				.getCurrentSession()
					.createQuery(selectQuery,Address.class)
						.setParameter("userId", userId)
						.setParameter("isShipping", true)
							.getResultList();
		
	}
	
	
	@Override
	public User get(int id) {
		try {			
			return sessionFactory.getCurrentSession().get(User.class, id);			
		}
		catch(Exception ex) {
			System.out.println(ex.getMessage());
			return null;
		}
	}

}
