package model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;

import util.DateTimeUtil;

@Entity
@Table(name = "Videos")
public class Video implements Serializable {

	@Id
	@GeneratedValue
	private Integer id;

	@NotEmpty
	@Size(max = 200)
	private String name;

	@NotEmpty
	@Size(max = 200)
	private String filename;

	private String trailer;

	private Boolean isYoutube;

	@Size(max = 200)
	private String director;

	@Size(max = 200)
	private String stars;

	@Size(max = 800)
	private String decrtn;

	private Double imdb;

	@Size(max = 200)
	private String poster;

	@Size(max = 40)
	private String country;

	@Size(max = 40)
	private String language;

	@NotNull
	private Integer tLike = 0;

	@NotNull
	private Integer tView = 0;

	@Temporal(TemporalType.TIMESTAMP)
	private Date time = DateTimeUtil.getCurrentGMTTime();

	@NotNull
	private Integer status = 0;

	@ManyToOne
	@JoinColumn(name = "UserId")
	private User user;

	@ManyToOne
	@JoinColumn(name = "GenreId")
	private Genre genre;

	@OneToMany(mappedBy = "video", fetch = FetchType.EAGER)
	private Collection<VideosLike> videoslikes;

	@OneToMany(mappedBy = "video", fetch = FetchType.EAGER)
	private Collection<VideosView> videosviews;

	@OneToMany(mappedBy = "video", fetch = FetchType.EAGER)
	private Collection<VideoComment> videocomment;

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

	public String getTrailer() {
		return trailer;
	}

	public void setTrailer(String trailer) {
		this.trailer = trailer;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public String getStars() {
		return stars;
	}

	public void setStars(String stars) {
		this.stars = stars;
	}

	public String getDecrtn() {
		return decrtn;
	}

	public void setDecrtn(String decrtn) {
		this.decrtn = decrtn;
	}

	public Double getImdb() {
		return imdb;
	}

	public void setImdb(Double imdb) {
		this.imdb = imdb;
	}

	public String getPoster() {
		return poster;
	}

	public void setPoster(String poster) {
		this.poster = poster;
	}

	public Boolean getIsYoutube() {
		return isYoutube;
	}

	public void setIsYoutube(Boolean isYoutube) {
		this.isYoutube = isYoutube;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public Integer gettLike() {
		return tLike;
	}

	public void settLike(Integer tLike) {
		this.tLike = tLike;
	}

	public Integer gettView() {
		return tView;
	}

	public void settView(Integer tView) {
		this.tView = tView;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Genre getGenre() {
		return genre;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
	}

	@JsonIgnore
	public Collection<VideosLike> getVideoslikes() {
		return videoslikes;
	}

	public void setVideoslikes(Collection<VideosLike> videoslikes) {
		this.videoslikes = videoslikes;
	}

	@JsonIgnore
	public Collection<VideosView> getVideosviews() {
		return videosviews;
	}

	public void setVideosviews(Collection<VideosView> videosviews) {
		this.videosviews = videosviews;
	}

	@JsonIgnore
	public Collection<VideoComment> getVideocomment() {
		return videocomment;
	}

	public void setVideocomment(Collection<VideoComment> videocomment) {
		this.videocomment = videocomment;
	}

}
