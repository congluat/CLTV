package model;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.sun.xml.internal.org.jvnet.fastinfoset.sax.ExtendedContentHandler;

@Entity
@Table(name = "Genres")
public class Genre implements Serializable {
	@Id
	@GeneratedValue
	private Integer id;

	@NotEmpty
	@Size(max = 40)
	private String name;

	@Size(max=400)
	public String photo;
	
	@OneToMany(mappedBy = "genre")
	private Collection<Video> videos;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}	
	
	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	@JsonIgnore
	public Collection<Video> getVideos() {
		return videos;
	}
	
	public void setVideos(Collection<Video> videos) {
		this.videos = videos;
	}
	
	
}
