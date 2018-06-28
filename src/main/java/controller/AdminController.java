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
@RequestMapping("/Admin")
public class AdminController {
	
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
	
	@RequestMapping(value = {"/index",""}, method = RequestMethod.GET)
	public String home(ModelMap model) {
		model.addAttribute("title","Quản lý");
		return "Admin/home";
	}
	
	
	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public String upload(ModelMap model) {
		model.addAttribute("video", new Video());
		model.addAttribute("title", "Upload");
		return "Admin/upload";
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public String upload(HttpServletRequest request, HttpServletResponse response, ModelMap model,
			@ModelAttribute Video video, @RequestParam("file") MultipartFile file) {

		User user = (User) request.getSession().getAttribute("currentUser");
		video.setUser(user);
		boolean result = videoService.upload(request, video, file);
		if (result == true) {
			model.addAttribute("title", "Upload Successed");
			return "redirect:/Videos/listVideos";
		} else {
			model.addAttribute("title", "Upload failed");
			return "Admin/upload";
		}

	}
	
	@RequestMapping(value = "/listVideos", method = RequestMethod.GET)
	public String listVideos(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		List<Video> videos = videoService.listAllVideos();
		System.out.println(videos.size());
		model.addAttribute("videos", videos);
		model.addAttribute("title","Danh sách phim");
		return "Admin/mngvds";
	}

	@RequestMapping(value="/edit/{id}" , method=RequestMethod.GET)
	public String editVideo(@PathVariable int id, ModelMap model){
		Video video = videoService.getVideoById(id);
		model.addAttribute("video", video);
		model.addAttribute("title",video.getName());
		return "Admin/upload";
	}
	
	@RequestMapping(value="/edit/{id}" , method=RequestMethod.POST)
	public String editVideo(@PathVariable int id, ModelMap model, @ModelAttribute Video video){
		boolean result = videoService.edit(video);
		if(result==true){
			model.addAttribute("title", "Thành công");
			return "redirect:/Admin/listVideos";
		}else{
			model.addAttribute("title", "Thất bại");
			return "redirect:/Admin/listVideos";
		}
	}
	
	@RequestMapping(value="/listTypes", method=RequestMethod.GET)
	public String getTypes(ModelMap model){
		List<Type> list = typeService.getAllTypes();
		model.addAttribute("types", list);
		model.addAttribute("title", "Các thể loại");
		return "Admin/mngtyp";
	}
	
	@RequestMapping(value="/listGenres", method=RequestMethod.GET)
	public String getGenres(ModelMap model){
		List<Genre> list = genreService.getAllGenres();
		model.addAttribute("genres", list);
		model.addAttribute("title", "Các thể loại");
		return "Admin/mnggnrs";
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
