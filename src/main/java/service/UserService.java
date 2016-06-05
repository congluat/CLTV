package service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import model.Result;
import model.User;

public interface UserService {
	public Result registerUser(User user);

	public Result login(HttpServletRequest request, String username, String password);

	public Result update(User user);
	
	public void delete(User user);

	public User getUserByd(int id);

	public boolean isExistedUsername(String username);

	public User getUserByUsername(String username);

	public boolean isExistedEmail(String email);

	public User getUserByEmail(String email);
}
