package model;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

@Entity
@Table(name = "Users")
public class User implements Serializable {

	@Id
	@GeneratedValue
	private Integer id;

	@NotEmpty
	@Size(max = 20)
	private String username;

	@NotEmpty
	@Size(max = 40)
	private String password;

	@NotEmpty
	@Size(max = 40)
	private String email;

	@NotEmpty
	@Size(max = 8)
	private String doB;

	@NotNull
	@Range(min = 0, max = 3)
	private Integer status;

	@Temporal(TemporalType.TIMESTAMP)
	private Date time = new Date();

	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private Collection<UserPermission> userPermissions;

	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private Collection<Video> videos;

	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private Collection<VideosLike> videoslikes;

	@OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
	private Collection<VideoComment> videocomments;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDoB() {
		return doB;
	}

	public void setDoB(String doB) {
		this.doB = doB;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public Collection<UserPermission> getUserPermissions() {
		return userPermissions;
	}

	public void setUserPermissions(Collection<UserPermission> userPermissions) {
		this.userPermissions = userPermissions;
	}

	public Collection<Video> getVideos() {
		return videos;
	}

	public void setVideos(Collection<Video> videos) {
		this.videos = videos;
	}

	public Collection<VideosLike> getVideoslikes() {
		return videoslikes;
	}

	public void setVideoslikes(Collection<VideosLike> videoslikes) {
		this.videoslikes = videoslikes;
	}

	public Collection<VideoComment> getVideocomments() {
		return videocomments;
	}

	public void setVideocomments(Collection<VideoComment> videocomments) {
		this.videocomments = videocomments;
	}
	
	

}
