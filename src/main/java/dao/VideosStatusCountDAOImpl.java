package dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.VideosStatusCount;

@Repository
public class VideosStatusCountDAOImpl implements VideosStatusCountDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private int getCount(int status) {
		Session session = sessionFactory.openSession();
		VideosStatusCount v = (VideosStatusCount) session.createQuery("FROM VideosStatusCount WHERE id=1")
				.uniqueResult();
		session.close();
		if (status == 0) {
			return v.getPending();
		} else if (status == 1) {
			return v.getProcessing();
		} else if (status == 2) {
			return v.getSuccessed();
		} else if (status == 3) {
			return v.getFailed();
		} else
			return -1;
		
	}

	@Override
	public int getTPending() {
		return getCount(0);
	}

	@Override
	public int getTProcessing() {
		return getCount(1);
	}

	@Override
	public int getTSuccessed() {
		return getCount(2);
	}

	@Override
	public int getTFailed() {
		return getCount(3);
	}

}
