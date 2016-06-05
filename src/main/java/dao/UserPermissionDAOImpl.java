package dao;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import model.Permission;
import model.User;

public class UserPermissionDAOImpl  implements UserPermissionDAO{
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
	public boolean isUserAllowed(String action, User user) {
		Session session = sessionFactory.openSession();
		try {
			Permission p = null;
			String hql = "FROM UserPermission WHERE permission.controller = :controller AND user.id = :userId";
			Query query = session.createQuery(hql);
			query.setParameter("controller", action);
			query.setParameter("userId", user.getId());
			p = (Permission) query.uniqueResult();
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
