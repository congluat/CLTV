package dao;

import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Genre;
import model.Type;
import model.Video;
import model.VideosLike;
import model.VideosView;

@Repository
public class VideoDAOImpl implements VideoDAO {

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
	public Exception upload(Video video) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(video);
			tx.commit();
			return null;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return e;
		} finally {
			session.close();
		}
	}

	@Override
	public Exception edit(Video video) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.saveOrUpdate(video);
			tx.commit();
			return null;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return e;
		} finally {
			session.close();
		}
	}

	@Override
	public Exception delete(Video video) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.saveOrUpdate(video);
			tx.commit();
			return null;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return e;
		} finally {
			session.close();
		}
	}

	@Override
	public List<Video> listAllVideos() {
		Session session = sessionFactory.openSession();
		List<Video> list = session.createQuery("FROM Video").list();
		session.close();
		return list;
	}

	@Override
	public List<Video> listVideosByPage(int page) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Video WHERE status=2 ORDER BY time DESC";
		Query query = session.createQuery(hql);
		/*
		 * page = 1 : f=0 m=20 page = 2 : f=20 m=40 page = 3 : f=40 m=60 page =
		 * 10: f=180 m=200
		 * 
		 */
		query.setFirstResult((page - 1) * 20);
		query.setMaxResults(page * 20);
		List<Video> list = query.list();
		session.close();
		return list;
	}

	@Override
	public List<Video> listVideosByGenresnPage(Genre genre, int page) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Video WHERE genre.id = :genre AND status=2 ORDER BY id DESC";
		Query query = session.createQuery(hql);
		query.setParameter("genre", genre.getId());
		query.setFirstResult((page - 1) * 20);
		query.setMaxResults(page * 20);
		List<Video> list = query.list();
		session.close();
		return list;
	}

	@Override
	public List<Video> listVideosByGenresCount(Genre genre, int count) {

		return null;
	}

	@Override
	public List<Video> listVideosByTypeCount(Type type, int count) {

		return null;
	}

	@Override
	public List<Video> listVideosByTypenPage(Type type, int page) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Video WHERE Type.id = :type AND status=2 ORDER BY id DESC";
		Query query = session.createQuery(hql);
		query.setParameter("type", type.getId());
		query.setFirstResult((page - 1) * 20);
		query.setMaxResults(page * 20);
		List<Video> list = query.list();
		session.close();
		return list;
	}

	@Override
	public Video getVideoById(int id) {
		Session session = sessionFactory.openSession();
		Video video = (Video) session.get(Video.class, id);
		session.close();
		return video;
	}

	@Override
	public boolean addView(VideosView vv) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(vv);
			tx.commit();
			return true;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}

	}

	@Override
	public boolean addLike(VideosLike vl) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		try {
			session.save(vl);
			tx.commit();
			return true;
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
			return false;
		} finally {
			session.close();
		}
	}

	@Override
	public List<Video> listNewest(int page) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Video WHERE status=2 ORDER BY time DESC";
		Query query = session.createQuery(hql);
		query.setFirstResult((page - 1) * 20);
		query.setMaxResults(page * 20);
		List<Video> list = query.list();
		session.close();
		return list;
	}

	@Override
	public List<Video> listByView(int page) {
		Session session = sessionFactory.openSession();
		String hql = "FROM Video WHERE status=2 ORDER BY tView DESC";
		Query query = session.createQuery(hql);
		query.setFirstResult((page - 1) * 20);
		query.setMaxResults(page * 20);
		List<Video> list = query.list();
		session.close();
		return list;
	}

	@Override
	public List<Video> search(String key) {
		Session session = sessionFactory.openSession();
		List<Video> list = session
				.createQuery(
						"FROM Video WHERE name LIKE '%" + key + "%' OR director LIKE '%" + key + "%' OR stars LIKE '%"
								+ key + "%' OR genre.name LIKE '%" + key + "%' OR type.name LIKE '%" + key + "%' ")
				.list();

		session.close();
		return list;
	}

}
