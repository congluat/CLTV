package controller;

import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import model.Genre;
import model.Type;
import model.User;
import model.Video;
import service.GenreService;
import service.TypeService;
import service.UserService;
import service.VideoService;

@Controller
@RequestMapping("/Videos")
public class VideoController {

	@Autowired
	@Qualifier("videoService")
	VideoService videoService;

	@Autowired
	@Qualifier("genreService")
	GenreService genreService;
	
	@Autowired
	@Qualifier("typeService")
	TypeService typeService;

	@Autowired
	@Qualifier("userService")
	UserService userService;
	
	@RequestMapping(value="/showAlls/{page}",method=RequestMethod.GET)
	public String showAlls(@PathVariable int page, ModelMap model){
		List<Video> videos = videoService.listVideosByPage(page);
		model.addAttribute("videos", videos);
		model.addAttribute("title","Danh sách phim");
		return "Watch/listVideos";
	}
	
	@RequestMapping(value="/newest/{page}", method=RequestMethod.GET)
	public String ShowNewest(@PathVariable int page, ModelMap model){
		List<Video> videos = videoService.listNewest(page);
		model.addAttribute("videos", videos);
		model.addAttribute("title","Phim mới nhất");
		return "Watch/listVideos";
	}
	
	
	@RequestMapping(value="/mostviewed/{page}", method=RequestMethod.GET)
	public String ShowMostViewed(@PathVariable int page, ModelMap model){
		List<Video> videos = videoService.listByView(page);
		model.addAttribute("videos", videos);
		model.addAttribute("title","Xem nhiều nhất");
		return "Watch/listVideos";
	}
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String SearchVideo(ModelMap model, @RequestParam String key){
		List<Video> videos = videoService.search(key);
		model.addAttribute("videos", videos);
		model.addAttribute("key",key);
		model.addAttribute("title","Tìm "+key);
		return "Watch/search";
	}
	
	@ModelAttribute("genres")
	public Collection<Genre> getGenres() {
		List<Genre> genres = genreService.getAllGenres();
		return genres;
	}
	
	@ModelAttribute("types")
	public Collection<Type> getTypes() {
		List<Type> types = typeService.getAllTypes();
		return types;
	}
}
