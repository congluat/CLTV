package service;

import model.User;

public interface PermissionService {
	public boolean isAction(String action);
	public boolean isUserAllowed(String action, User user);
}
