package com.YoungTigers.thleaf.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.YoungTigers.thleaf.entities.User;
import com.YoungTigers.thleaf.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
@Autowired
UserRepository userRepository;

@Override
public List<User> findAll() {
	return userRepository.findAll();
} 
}
