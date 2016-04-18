package dao;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.User;

@Repository
public class UserDAOImpl implements UserDAO {

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
	public void createUser(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(user);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			logger.error(e);
		} finally {
			session.close();
		}
	}

	@Override
	public void updateUser(User user) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.saveOrUpdate(user);
			tx.commit();
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			logger.error(e);
		} finally {
			session.close();
		}

	}

	@Override
	public User getUserById(int id) {
		Session session = sessionFactory.openSession();
		User user = new User();
		try {
			user = (User) session.get(User.class, id);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
		} finally {
			session.close();
		}
		return user;
	}

	@Override
	public boolean isValidUser(String un, String pw) {
		Session session = sessionFactory.openSession();
		User user = new User();
		try {
			user = null;
			String hql = "FROM User WHERE username = :username AND password = :password AND status != 3";
			Query query = session.createQuery(hql);
			query.setParameter("username", un);
			query.setParameter("password", pw);
			user = (User) query.uniqueResult();

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
		} finally {
			session.close();
		}
		if (user == null) {
			return false;
		} else {
			return true;
		}
	}

	@Override
	public User getUserByUsername(String username) {
		Session session = sessionFactory.openSession();
		User user;
		try {
			String hql = "FROM User WHERE username = '" + username + "'";
			user = (User) session.createQuery(hql).uniqueResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			return null;
		} finally {
			session.close();
		}

	}

	@Override
	public User getUserByEmail(String email) {
		Session session = sessionFactory.openSession();
		User user;
		try {
			String hql = "FROM User WHERE email = '" + email + "'";
			user = (User) session.createQuery(hql).uniqueResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			return null;
		} finally {
			session.close();
		}
	}

}
