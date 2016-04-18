package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/Theater")
public class TheaterController {
	/**
	 * @author LuatNguyen
	 * @param VideoId
	 * @return Watch/theater.jsp
	 * Redirect to theater view. 
	 */
	@RequestMapping(value = "/play", method = RequestMethod.GET)
	public String playVideo() {
		return "Watch/theater";
	}
}
