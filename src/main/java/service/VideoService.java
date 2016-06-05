package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import model.Genre;
import model.Video;
import model.VideosLike;
import model.VideosView;

public interface VideoService {

	public boolean upload(HttpServletRequest request, Video video, MultipartFile file);

	public boolean edit(HttpServletRequest request, Video video, MultipartFile file);

	public boolean edit(Video video);
	
	public boolean delete(Video video);

	public List<Video> listAllVideos();

	public List<Video> listVideosByPage(int page);

	public List<Video> listVideosByGenresnPage(Genre genre, int page);

	public List<Video> listNewest(int page);

	public List<Video> listByView(int page);
	
	public List<Video> search(String key);

	public Video getVideoById(int id);

	public boolean addView(VideosView vv);

	public boolean addLike(VideosLike vl);
}
