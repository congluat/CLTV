package service;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import dao.GenreDAO;
import dao.VideoDAO;
import model.Genre;

@Service
public class GenreServiceImpl implements GenreService {
	@Autowired
	@Qualifier("genreDAO")
	private GenreDAO genreDAO;
	
	@Autowired
	ServletContext application;

	@Override
	public List<Genre> getAllGenres() {
		
		return genreDAO.getAllGenres();
	}
	
	
}
