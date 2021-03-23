package com.YoungTigers.tekko.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.YoungTigers.tekko.entites.Role;
import com.YoungTigers.tekko.repository.RoleRepository;

@Service
public class RoleServiceImpl implements RoleService {
@Autowired
RoleRepository roleRepository;
	@Override
	public List<Role> findAll() {
		return roleRepository.findAll();
	}
	@Override
	public Role findByName(String string) {
		return roleRepository.findByName(string);
	}
	@Override
	public Role save(Role roleSave) {
		return roleRepository.save(roleSave);
	}

}
