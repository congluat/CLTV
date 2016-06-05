package dao;

import model.User;

public interface UserPermissionDAO {
	
	public boolean isUserAllowed(String action, User user);
}
