package service;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dao.TypeDAO;
import model.Type;

@Service
public class TypeServiceImpl implements TypeService {
	@Autowired
	@Qualifier("typeDAO")
	private TypeDAO typeDAO;
	
	@Autowired
	ServletContext application;

	@Override
	public List<Type> getAllTypes() {		
		return typeDAO.getAllTypes();
	}
	
	
}
