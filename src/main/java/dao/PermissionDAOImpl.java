package dao;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Permission;
import model.User;

@Repository
public class PermissionDAOImpl implements PermissionDAO{

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
	public boolean isAction(String action) {Session session = sessionFactory.openSession();
		try {

			
			Permission p = null;
			p = (Permission) session.createQuery("FROM Permission WHERE controller='"+action+"'").uniqueResult();
			if(p==null)
				return false;
			else
				return true;
		} catch (Exception e) {
			e.printStackTrace();
			return true;
		}finally {
			session.close();
		}
		
		
	}

	

}
