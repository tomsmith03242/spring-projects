package com.YoungTigers.tekko.repository;

import java.util.List;
import java.util.Map;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.YoungTigers.tekko.entites.User;

public interface UserRepository extends JpaRepository<User, Long> {

	User findByUsername(String username);
@Query(value="SELECT u2.id, u2.username,u2.count, t.my_rank from user u2 left join (SELECT u.id,u.username,u.firstname,u.lastname, u.count, RANK() OVER ( ORDER BY u.count desc ) my_rank FROM user u) as t on u2.id = t.id WHERE u2.id=:userid", nativeQuery=true)
	List<Map<String, Object>> userRankList(Long userid);

@Query(value="SELECT u.id,u.firstname,u.aliasname,u.lastname,u.city ,ds.user_id,sum(ds.dailyscore) as dailyscore FROM user u,dailyscore ds where date(DATE_SUB(now(), INTERVAL :day day)) < date(ds.updated_time)and u.id = ds.user_id group by ds.user_id order by dailyscore desc,u.firstname asc,u.aliasname asc LIMIT :fetch, 10", nativeQuery=true)
List<Map<String, Object>> leadersBoardData(int day,int fetch);

@Query(value="SELECT * FROM articles WHERE MATCH (title,body) AGAINST (:keyword IN NATURAL LANGUAGE MODE)", nativeQuery=true)
List<Map<String, Object>> searchInArticle(String keyword);

}
