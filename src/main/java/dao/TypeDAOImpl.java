package dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Type;

@Repository
public class TypeDAOImpl implements TypeDAO {

	private static final Logger logger = Logger.getLogger(UserDAOImpl.class);

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public List<Type> getAllTypes() {
		Session session = sessionFactory.openSession();
		List<Type> list = session.createQuery("FROM Type").list();
		session.close();
		return list;
	}
	
}
