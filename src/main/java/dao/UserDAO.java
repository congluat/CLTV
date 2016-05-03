package dao;

import model.User;
import model.VideosLike;
import model.VideosView;

public interface UserDAO {

	public void createUser(User user);

	public void updateUser(User user);

	public User getUserById(int id);

	public User getUserByUsername(String username);

	public User getUserByEmail(String email);
	
	public boolean isValidUser(String un, String pw);

}
