package service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dao.UserDAO;
import model.Result;
import model.User;
import util.MD5Encrypt;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	@Qualifier("userDAO")
	private UserDAO userDao;

	@Override
	public Result registerUser(User user) {
		try {
			// create user when all info are filled
			if (isExistedUsername(user.getUsername()) == true) {
				return new Result(false, "Username is existed");
			} else if (isExistedEmail(user.getEmail()) == true) {
				return new Result(false, "Email is existed");
			} else if (user.getUsername().equals("") || user.getPassword().equals("") || user.getEmail().equals("")
					|| user.getDoB().equals("") || user.getStatus().equals("") || user.getTime().equals("")) {

				return new Result(false, "Data can not be blank");
			} else {
				user.setPassword(MD5Encrypt.hashString(user.getPassword()));
				userDao.createUser(user);

				return new Result(true, "Register successed");
			}

		} catch (Exception e) {
			e.printStackTrace();
			return new Result(false, "Register failed");
		}
	}

	@Override
	public Result login(HttpServletRequest request,String username, String password) {
		try {

			if (username.equals("") || password.equals("")) {
				return new Result(false,"Username or Password can't be empty");
			} else {
				boolean result = userDao.isValidUser(username, MD5Encrypt.hashString(password));
				if (result == true) {
					request.getSession().setAttribute("CurrentUser", getUserByUsername(username) );
					request.getSession().setAttribute("currentUser", getUserByUsername(username));
					return new Result(true, "Login successed");
				} else {
					return new Result(false, "Username or Password is incorrect");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return new Result(false, "Fail to login");
		}

	}

	@Override
	public void delete(User user) {
		user.setStatus(3);
		userDao.updateUser(user);

	}

	@Override
	public User getUserByd(int id) {
		
		return userDao.getUserById(id);
	}

	@Override
	public User getUserByUsername(String username) {

		return userDao.getUserByUsername(username);
	}

	@Override
	public boolean isExistedUsername(String username) {
		boolean result = false;
		if (getUserByUsername(username) != null) {
			result = true;
		} else {
			result = false;
		}
		return result;
	}

	@Override
	public boolean isExistedEmail(String email) {
		if (getUserByEmail(email) != null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public User getUserByEmail(String email) {
		
		return userDao.getUserByEmail(email);
	}

}
