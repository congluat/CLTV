package service;

import java.io.File;
import java.io.InputStream;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import dao.VideoDAO;
import model.Genre;
import model.Video;
import model.VideosLike;
import model.VideosView;
import util.DateTimeUtil;

@Service
public class VideoServiceImpl implements VideoService {

	@Autowired
	@Qualifier("videoDAO")
	private VideoDAO videoDAO;

	@Autowired
	ServletContext application;

	@Override
	public boolean upload(HttpServletRequest request, Video video, MultipartFile file) {
		String poster = file.getOriginalFilename();

		if (!file.isEmpty()) {
			try {
				InputStream input = file.getInputStream();
				if (ImageIO.read(input) == null) {
					return false;
				}
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}

			try {
				Date now = new Date();
				String name = now.toString().replaceAll(" ", "").replaceAll(":", "");
				poster = name + poster;

				ServletContext servletContext = request.getSession().getServletContext();
				String relativeWebPath = "/resources/poster/";
				String absoluteDiskPath = servletContext.getRealPath(relativeWebPath);
				System.out.println(absoluteDiskPath);
				File f = new File(absoluteDiskPath);

				if (f.exists() && f.isDirectory()) {

				} else {
					f.mkdir();
				}
				// String path = application.getRealPath("/resources/poster/") +
				// poster;
				String path = absoluteDiskPath + poster;
				if (!poster.equals("")) {

					file.transferTo(new File(path));
					video.setPoster(poster);
				}
			} catch (Exception e) {
				video.setPoster("abc.png");
			}
		}

		video.settLike(0);
		video.settView(0);
		video.setTime(DateTimeUtil.getCurrentGMTTime());
		video.setStatus(0);

		if (videoDAO.upload(video) == null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean edit(Video video) {
		if (videoDAO.edit(video) == null) {
			return true;
		} else {
			return false;
		}
		
	}
	
	@Override
	public boolean edit(HttpServletRequest request, Video video, MultipartFile file) {
		String poster = file.getOriginalFilename();

		if (!file.isEmpty()) {
			try {
				InputStream input = file.getInputStream();
				if (ImageIO.read(input) == null) {
					return false;
				}
			} catch (Exception e) {
				e.printStackTrace();
				return false;
			}

			try {
				Date now = new Date();
				String name = now.toString().replaceAll(" ", "").replaceAll(":", "");
				poster = name + poster;

				ServletContext servletContext = request.getSession().getServletContext();
				String relativeWebPath = "/resources/poster/";
				String absoluteDiskPath = servletContext.getRealPath(relativeWebPath);
				System.out.println(absoluteDiskPath);
				File f = new File(absoluteDiskPath);

				if (f.exists() && f.isDirectory()) {

				} else {
					f.mkdir();
				}
				// String path = application.getRealPath("/resources/poster/") +
				// poster;
				String path = absoluteDiskPath + poster;
				if (!poster.equals("")) {

					file.transferTo(new File(path));
					video.setPoster(poster);
				}
			} catch (Exception e) {
				video.setPoster("abc.png");
			}
		}

		
		if (videoDAO.edit(video) == null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean delete(Video video) {
		
		
		if (videoDAO.edit(video) == null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<Video> listAllVideos() {
		return videoDAO.listAllVideos();
	}

	@Override
	public List<Video> listVideosByPage(int page) {
		return videoDAO.listVideosByPage(page);
	}

	@Override
	public List<Video> listVideosByGenresnPage(Genre genre, int page) {
		return videoDAO.listVideosByGenresnPage(genre, page);
	}

	@Override
	public Video getVideoById(int id) {
		return videoDAO.getVideoById(id);
	}

	@Override
	public boolean addView(VideosView vv) {
		return videoDAO.addView(vv);
	}

	@Override
	public boolean addLike(VideosLike vl) {
		return videoDAO.addLike(vl);
	}

	@Override
	public List<Video> listNewest(int page) {
		
		return videoDAO.listNewest(page);
	}

	@Override
	public List<Video> listByView(int page) {
		
		return videoDAO.listByView(page);
	}

	@Override
	public List<Video> search(String key) {
		
		return videoDAO.search(key);
	}

}
