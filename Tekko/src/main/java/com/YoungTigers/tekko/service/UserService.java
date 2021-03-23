package com.YoungTigers.tekko.service;

import java.util.List;
import java.util.Map;

import com.YoungTigers.tekko.entites.User;

public interface UserService {

	User findByUsername(String username);

	User save(User userForm);

	List<Map<String, Object>> userRankList(Long userid);

	List<Map<String, Object>> leadersBoardData(int day,int fetch);

	List<Map<String, Object>> searchInArticle(String keyword);

}
