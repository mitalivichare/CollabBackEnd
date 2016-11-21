 package com.collaboration.configuration;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.collaboration.service.UserService;
import com.collaboration.service.UserServiceImpl;
import com.collaboration.model.Blog;
import com.collaboration.model.Forum;
import com.collaboration.model.Message;
import com.collaboration.model.OutputMessage;
/*import com.collaboration.model.Blog;
import com.collaboration.model.Chat;
import com.collaboration.model.ChatForum;
import com.collaboration.model.ChatForumComment;
import com.collaboration.model.Event;
import com.collaboration.model.Friend;
import com.collaboration.model.Job;
import com.collaboration.model.JobApplication;*/
import com.collaboration.model.User;

@Configuration
@ComponentScan("com.collaboration")
@EnableTransactionManagement
public class ApplicationContextConfig {
	
	
	@Bean(name = "dataSource")
	public DataSource getOracleDataSource() {
		
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("oracle.jdbc.driver.OracleDriver");
		dataSource.setUrl("jdbc:oracle:thin:@localhost:1521:XE");
		dataSource.setUsername("mitali"); //Schema name
		dataSource.setPassword("mitali");
		Properties connectionProperties = new Properties();
		connectionProperties.setProperty("hibernate.dialect","org.hibernate.dialect.Oracle10gDialect");
		dataSource.setConnectionProperties(connectionProperties);
		return dataSource;
	}
	
	@Autowired
	@Bean(name = "sessionFactory")
	public SessionFactory getSessionFactory(DataSource dataSource) {
		LocalSessionFactoryBuilder sessionBuilder = new LocalSessionFactoryBuilder(dataSource);
		//sessionBuilder.addProperties(getHibernateProperties());
		sessionBuilder.addAnnotatedClass(User.class);
		sessionBuilder.addAnnotatedClass(Blog.class);
		sessionBuilder.addAnnotatedClass(Forum.class);
		sessionBuilder.addAnnotatedClass(Message.class);
		sessionBuilder.addAnnotatedClass(OutputMessage.class);

		return sessionBuilder.buildSessionFactory();
	}

	@Autowired
	@Bean(name = "transactionManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory) {
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);

		return transactionManager;
	}

	/*@Autowired
	@Bean(name = "userDetailsDAO")
	public UserDAO getUserDetailsDAO(SessionFactory sessionFactory) {
		return new UserDAOImpl(sessionFactory);
	}*/



}