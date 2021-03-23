package com.YoungTigers.tekko.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.YoungTigers.tekko.entites.Role;

public interface RoleRepository extends JpaRepository<Role, Long> {


	Role findByName(String string);

}
