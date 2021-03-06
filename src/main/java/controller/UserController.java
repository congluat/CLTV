package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.Result;
import model.User;
import service.UserService;

@Controller
@RequestMapping("/User")
public class UserController {

	@Autowired
	@Qualifier("userService")
	UserService userSvivce;

	/*
	 * @RequestMapping(value = "/register", method = RequestMethod.GET) public
	 * String registerUser(HttpServletRequest request, ModelMap model) { User
	 * user = new User(); model.addAttribute("user", user);
	 * 
	 * return "Watch/register"; }
	 */

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public Result registerUser(HttpServletRequest request, HttpServletResponse response, @RequestBody final User user) {
		System.out.println("Register runned");
		user.setStatus(1);
		user.setTime(new Date());

		return userSvivce.registerUser(user);

		// return "forward:/index";

	}

	@RequestMapping(value = "/login", method= RequestMethod.POST)
	@ResponseBody
	public Result login(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("remember") Boolean remember) throws IOException {
		/*if(userSvivce.login(request,username, password).getResult()==true){
			response.sendRedirect(request.getSession().getAttribute("prevURL").toString());
			return null;
		}else{*/
			return userSvivce.login(request,username, password);
		//}
		
	}
	
	@RequestMapping(value="/loginf", method=RequestMethod.GET)
	public String loginForm(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		model.addAttribute("title", "Đăng nhập");
		return "Watch/registerForm";
	}
	
	@RequestMapping(value="/Logout", method=RequestMethod.GET)
	public String logOut(HttpServletRequest request, HttpServletResponse response, ModelMap model){
		request.getSession().setAttribute("currentUser", null);
		return "redirect:/index";
	}

	@RequestMapping(value="/Profile", method=RequestMethod.GET)
	public String profile(ModelMap model, HttpServletRequest req){
		User user = (User) req.getSession().getAttribute("currentUser");
		if(user==null){
			return "redirect:/User/loginf";
		}else{
			user = userSvivce.getUserByd(user.getId());
			user.setPassword("");
			model.addAttribute("user",user);
			model.addAttribute("title", "Tài khoản");
		}	
		return "Watch/profile";
	}
	
	@RequestMapping(value="/Profile", method=RequestMethod.POST)
	public String saveProfile(ModelMap model, HttpServletRequest req, @ModelAttribute User user){
		user.setTime(new Date());
		Result r = userSvivce.update(user);		
		if(r.getResult()==true){
			//model.addAttribute("result", "Thảnh công");
		}else{
			//model.addAttribute("result", "Thất bại");
		}	
		//model.addAttribute("title", "Tài khoản");
		return "redirect:/User/Profile";
	}
}
