package controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
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

	@RequestMapping(value = "login")
	@ResponseBody
	public Result login(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("username") String username, @RequestParam("password") String password,
			@RequestParam("remember") Boolean remember) {
		
		return userSvivce.login(request,username, password);
	}

}
