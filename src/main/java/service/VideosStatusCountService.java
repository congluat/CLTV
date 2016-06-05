package service;

public interface VideosStatusCountService {
	public int getTPending();
	public int getTProcessing();
	public int getTSuccessed();
	public int getTFailed();
}
