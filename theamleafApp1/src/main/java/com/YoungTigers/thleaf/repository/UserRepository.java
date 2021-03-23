package com.YoungTigers.thleaf.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import com.YoungTigers.thleaf.entities.User;
public interface UserRepository extends JpaRepository<User, Long>{

}
