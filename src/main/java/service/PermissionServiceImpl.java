package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import dao.PermissionDAO;
import dao.UserDAO;
import dao.UserPermissionDAO;
import model.User;

public class PermissionServiceImpl implements PermissionService {

	@Autowired
	@Qualifier("permissionDAO")
	private PermissionDAO pDAO;

	@Autowired
	@Qualifier("userPermissionDAO")
	private UserPermissionDAO upDAO;
	
	@Override
	public boolean isAction(String action) {

		return pDAO.isAction(action);
	}

	@Override
	public boolean isUserAllowed(String action, User user) {
		if(user==null){
			return false;
		}else{
			return upDAO.isUserAllowed(action, user);	
		}	
	}

}
