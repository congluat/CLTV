package controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.User;
import model.Video;
import model.VideosView;
import service.UserService;
import service.VideoService;
import util.DateTimeUtil;

@Controller
@RequestMapping("/Theater")
public class TheaterController {
	
	@Autowired
	@Qualifier("videoService")
	VideoService videoService;
	
	@Autowired
	@Qualifier("userService")
	UserService userService;
	
	/**
	 * @author LuatNguyen
	 * @param VideoId
	 * @return Watch/theater.jsp
	 * Redirect to theater view. 
	 */
	@RequestMapping(value = "/play/{id}", method = RequestMethod.GET)
	public String playVideo(ModelMap model, @PathVariable int id, HttpServletRequest request) {
		Video video = videoService.getVideoById(id);
		model.addAttribute("video", video);
		model.addAttribute("title", video.getName());
		model.addAttribute("link", request.getRequestURL());
		return "Watch/theater";
	}
	
	@RequestMapping(value="/view/{id}" ,method=RequestMethod.GET)
	@ResponseBody
	public boolean addView(HttpServletRequest req,@PathVariable int id){
		
		Video video = videoService.getVideoById(id);
		
		VideosView vv = new VideosView();
		User user = (User) req.getSession().getAttribute("currentUser");
		
		if(user==null){
			user = userService.getUserByd(0);
		}
		vv.setUser(user);
		vv.setVideo(video);
		vv.setTime(DateTimeUtil.getCurrentGMTTime());
		videoService.addView(vv);
		
		video.settView(video.gettView()+1);
		videoService.edit(video);
		
		return true;
	}
	
}
