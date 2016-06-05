package interceptor;

import java.security.acl.Permission;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import model.User;
import service.PermissionService;
import service.UserService;

public class UserPermission implements HandlerInterceptor {

	@Autowired
	@Qualifier("userService")
	UserService userService;
	
	@Autowired
	@Qualifier("permissionService")
	PermissionService pService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		User user = null;
		user= (User) request.getSession().getAttribute("currentUser");
		System.out.println(request.getRequestURI());
		System.out.println(request.getContextPath());
		String reqURI = request.getRequestURI();
		String path = request.getContextPath();
		String action = reqURI.replace(path, "");
		/*if(reqURI.equals(path+"/index") || reqURI.equals(path+"/Theater/play")||reqURI.equals(path+"/User/loginf")){
			System.out.println("NOT runned");
			return true;
		}*/
		if(!pService.isAction(action)){
			System.out.println("URI NOT NEED to authen");
			return true;
		}
		else{
			System.out.println("URI NEED to authen");
			if(!pService.isUserAllowed(action, user)){
				request.getSession().setAttribute("prevURL", request.getRequestURL());
				response.sendRedirect(path+"/User/loginf");
				
				return false;
			}else{
				return true;
			}
		}
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
