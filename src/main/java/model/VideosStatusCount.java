package model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "VideosStatusCounts")
public class VideosStatusCount implements Serializable {

	@Id
	@GeneratedValue
	private Integer id;

	private Integer pending;
	private Integer processing;
	private Integer successed;
	private Integer failed;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPending() {
		return pending;
	}

	public Integer getProcessing() {
		return processing;
	}

	public Integer getSuccessed() {
		return successed;
	}

	public Integer getFailed() {
		return failed;
	}

}
