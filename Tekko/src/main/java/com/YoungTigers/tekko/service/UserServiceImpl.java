package com.YoungTigers.tekko.service;

import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.YoungTigers.tekko.entites.User;
import com.YoungTigers.tekko.repository.UserRepository;

@Service
public class UserServiceImpl implements UserService {
@Autowired
UserRepository userRepository;
	@Override
	public User findByUsername(String username) {
		return userRepository.findByUsername(username);
	}
	@Override
	public User save(User userForm) {
		return userRepository.save(userForm);
	}
	@Override
	public List<Map<String, Object>> userRankList(Long userid) {
		return userRepository.userRankList(userid);
	}
	@Override
	public List<Map<String, Object>> leadersBoardData(int day,int fetch) {
		List<Map<String, Object>> list =new LinkedList<>();
		list = userRepository.leadersBoardData( day, fetch);
		list.forEach(System.out::println);
		return list ;
		}
	@Override
	public List<Map<String, Object>> searchInArticle(String keyword) {
		return userRepository.searchInArticle( keyword);
	}

}
