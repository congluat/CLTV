package job;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import dao.UserDAOImpl;
import model.Video;
import service.VideoService;
import util.DateTimeUtil;

@Component
public class ValidateVideos {
	
	private static final Logger logger = Logger.getLogger(UserDAOImpl.class);

	@Autowired
	@Qualifier("videoService")
	VideoService videoService;
	
	public void run() throws IOException {
	
		List<Video> videos = videoService.listAllVideos();
		for (Video video : videos) {
			if (video.getStatus()!=4) {
				final URL url = new URL(video.getFilename());
				HttpURLConnection huc = (HttpURLConnection) url.openConnection();
				int responseCode = huc.getResponseCode();
				
				if (responseCode != 404) {
					System.out.println(video.getName()+ " GOOD");
					video.setStatus(2);
					
					
				} else {
					System.out.println(video.getName()+ " BAD");
					video.setStatus(3);
				}
				videoService.edit(video);
				logger.assertLog(true, video.getId()+DateTimeUtil.getCurrentGMTTime().toString());
			}
			
			
		}
		System.out.println("validate runned "+DateTimeUtil.getCurrentGMTTime());
		logger.assertLog(true, "validate runned "+DateTimeUtil.getCurrentGMTTime());
		
	}
}
