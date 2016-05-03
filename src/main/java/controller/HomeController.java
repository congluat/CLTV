package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Video;
import service.VideoService;

@Controller
public class HomeController {

	@Autowired
	@Qualifier("videoService")
	VideoService videoService;

	
	@RequestMapping(value = {"/","/home","/index"}, method = RequestMethod.GET )
	public String Home(ModelMap model) {
		List<Video> videos = videoService.listAllVideos();
		System.out.println(videos.size());
		model.addAttribute("videos", videos);
		model.addAttribute("title", "Trang chủ");
		return "Watch/home";
	}
	
	
}
