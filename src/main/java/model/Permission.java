package model;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="Permissions")
public class Permission implements Serializable{
	
	@Id
	@GeneratedValue
	private Integer id;
	
	@NotEmpty
	@Size(max=200)
	private String controller;
	
	@OneToMany(mappedBy="permission",fetch = FetchType.EAGER)
	private Collection<UserPermission> userPermissions;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getController() {
		return controller;
	}

	public void setController(String controller) {
		this.controller = controller;
	}
	
	@JsonIgnore
	public Collection<UserPermission> getUserPermissions() {
		return userPermissions;
	}

	public void setUserPermissions(Collection<UserPermission> userPermissions) {
		this.userPermissions = userPermissions;
	}
	
	
	
}
