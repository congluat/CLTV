package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import dao.VideosStatusCountDAO;

@Service
public class VideosStatusCountServiceImpl implements VideosStatusCountService {
	@Autowired
	@Qualifier("videosStatusCountDAO")
	private VideosStatusCountDAO videosStatusCountDAO;

	@Override
	public int getTPending() {
		return videosStatusCountDAO.getTPending();
	}

	@Override
	public int getTProcessing() {
		return videosStatusCountDAO.getTProcessing();
	}

	@Override
	public int getTSuccessed() {
		return videosStatusCountDAO.getTSuccessed();
	}

	@Override
	public int getTFailed() {
		return videosStatusCountDAO.getTFailed();
	}
}
