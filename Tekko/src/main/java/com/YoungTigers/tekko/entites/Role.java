package com.YoungTigers.tekko.entites;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.*;

import org.springframework.security.core.GrantedAuthority;

import com.fasterxml.jackson.annotation.JsonIgnore;



/**
 * The persistent class for the role database table.
 * 
 */
@Entity
//@Table(name="role")
@Table(name = "role", uniqueConstraints = @UniqueConstraint(columnNames = { "name" }))
@NamedQuery(name="Role.findAll", query="SELECT r FROM Role r")
public class Role implements GrantedAuthority,Serializable  { 
	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY)
	    private Long id;

	    private String name;
	    
	 
		@ManyToMany(mappedBy = "roles")
	    private Set<User> users;
		
		  public Role() {
			}

	    public Role(Long id) {
			super();
			this.id = id;
		}

		public Long getId() {
	        return id;
	    }

	    public void setId(Long id) {
	        this.id = id;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name;
	    }
	   // @JsonIgnore
	    public Set<User> getUsers() {
	        return users;
	    }

	    public void setUsers(Set<User> users) {
	        this.users = users;
	    }

		@Override
		public String getAuthority() {
			// TODO Auto-generated method stub
			return name;
		}

}