package dao;

public interface VideosStatusCountDAO {
	public int getTPending();
	public int getTProcessing();
	public int getTSuccessed();
	public int getTFailed();
}
