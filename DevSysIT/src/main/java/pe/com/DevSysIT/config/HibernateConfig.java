package pe.com.DevSysIT.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan(basePackages={"pe.com.DevSysIT.dto"})
@EnableTransactionManagement
public class HibernateConfig {

	//constantes ORACLE
	/*private static final String DRIVER="oracle.jdbc.driver.OracleDriver";
	private static final String DIALECT="org.hibernate.dialect.Oracle10gDialect";
	private static final String URL="jdbc:oracle:thin:@localhost:1521:xe";
	private static final String USER="bd_venta";
	private static final String PASSWORD="123";*/
	
	//constantes MySQL
	/*private static final String DRIVER="com.mysql.jdbc.Driver";
	private static final String DIALECT="org.hibernate.dialect.MySQLDialect";
	private static final String URL="jdbc:mysql://localhost:3306/bd_venta";
	private static final String USER="root";
	private static final String PASSWORD="";*/
	
	//constantes H2
	private static final String DRIVER="org.h2.Driver";
	private static final String DIALECT="org.hibernate.dialect.H2Dialect";
	private static final String URL="jdbc:h2:tcp://localhost/~/onlineshopping";
	private static final String USER="sa";
	private static final String PASSWORD="";
	
	
	@Bean("dataSource")
	public DataSource getDataSource(){
		BasicDataSource dataSource=new BasicDataSource();
		dataSource.setDriverClassName(DRIVER);
		dataSource.setUrl(URL);
		dataSource.setUsername(USER);
		dataSource.setPassword(PASSWORD);
		return dataSource;
	}
	
	@Bean
	public SessionFactory getSessionFactory(DataSource dataSource){
		LocalSessionFactoryBuilder builder=new LocalSessionFactoryBuilder(dataSource);
		builder.addProperties(getHibernateProperties());
		builder.scanPackages("pe.com.DevSysIT.dto");
		return builder.buildSessionFactory();
	}

	private Properties getHibernateProperties() {
		// TODO Auto-generated method stub
		Properties properties=new Properties();
		properties.put("hibernate.dialect", DIALECT);
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.format_sql", "true");
		return properties;
	}
	
	@Bean
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory){
		HibernateTransactionManager transactionManager=new HibernateTransactionManager(sessionFactory);
		return transactionManager;
	}
}
