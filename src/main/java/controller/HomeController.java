package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.Type;
import model.Video;
import service.TypeService;
import service.VideoService;

@Controller
public class HomeController {

	@Autowired
	@Qualifier("videoService")
	VideoService videoService;

	@Autowired
	@Qualifier("typeService")
	TypeService typeService;
	
	
	@RequestMapping(value = {"/","/home","/index"}, method = RequestMethod.GET )
	public String Home(ModelMap model) {
		List<Type> types = typeService.getAllTypes();
		model.addAttribute("types", types);
		model.addAttribute("title", "Trang chủ");
		return "Watch/home";
	}
	
	
}
