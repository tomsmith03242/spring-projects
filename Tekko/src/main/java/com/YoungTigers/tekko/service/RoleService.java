package com.YoungTigers.tekko.service;

import java.util.List;

import com.YoungTigers.tekko.entites.Role;

public interface RoleService {

	List<Role> findAll();

	Role findByName(String string);

	Role save(Role roleSave);

}
