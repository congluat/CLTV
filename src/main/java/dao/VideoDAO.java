package dao;

import java.util.List;

import model.Genre;
import model.Type;
import model.Video;
import model.VideosLike;
import model.VideosView;

public interface VideoDAO {

	public Exception upload(Video video);

	public Exception edit(Video video);

	public Exception delete(Video video);

	public List<Video> listAllVideos();

	public List<Video> listVideosByPage(int page);

	public List<Video> listVideosByGenresnPage(Genre genre, int page);
	
	public List<Video> listVideosByGenresCount(Genre genre, int count);
	
	public List<Video> listVideosByTypenPage(Type type, int Page);
	
	public List<Video> listVideosByTypeCount(Type type, int count);
		
	public List<Video> listNewest(int page);
	
	public List<Video> listByView(int page);
	
	public List<Video> search(String key);
	
	public Video getVideoById(int id);
	
	public boolean addView(VideosView vv);
	
	public boolean addLike(VideosLike vl);
}
