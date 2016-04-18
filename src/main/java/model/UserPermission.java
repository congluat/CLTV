package model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="UserPermissions")
public class UserPermission implements Serializable{
	
	@Id
	@GeneratedValue
	private Integer id;
	
	@NotEmpty
	private Boolean isAllow=false;
	
	@ManyToOne()
	@JoinColumn(name="UserId")
	private User user;
	
	@ManyToOne()
	@JoinColumn(name="PermissionId")
	private Permission permission;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Boolean getIsAllow() {
		return isAllow;
	}

	public void setIsAllow(Boolean isAllow) {
		this.isAllow = isAllow;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Permission getPermission() {
		return permission;
	}

	public void setPermission(Permission permission) {
		this.permission = permission;
	}
	
}
