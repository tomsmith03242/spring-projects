package com.YoungTigers.tekko.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.YoungTigers.tekko.entites.Role;
import com.YoungTigers.tekko.entites.User;
import com.YoungTigers.tekko.service.RoleService;
import com.YoungTigers.tekko.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	@Autowired
	RoleService roleService;

	BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder();

	/**
	 * @param model
	 * @return
	 */
	@GetMapping("/registration")
	public String registration(Model model) {
		model.addAttribute("userForm", new User());
		model.addAttribute("roles", roleService.findAll());
		return "registration";
	}

	/**
	 * @param userForm
	 * @param bindingResult
	 * @return
	 */
	@PostMapping("/registration")
	public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult,
			HttpServletRequest req) {
		userForm.setPassword(new String(bCryptPasswordEncoder.encode(userForm.getPassword())));
		int status = 0;
// 	ROLE_USER
		Role roleObj = roleService.findByName("ROLE_USER");
		List<Role> roleId = new ArrayList();
		if (roleObj == null) {
			Role roleSave = new Role();
			roleSave.setName("ROLE_USER");
			try {
				roleObj = roleService.save(roleSave);
				roleId.add(new Role(roleObj.getId()));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		List<Long> arrRoles = new ArrayList<Long>();
		for (Role r : userForm.getRoles()) {
			arrRoles.add(r.getId());
		}
		boolean ans = arrRoles.contains(roleObj.getId());
		if (ans)
			System.out.println("");
		else
			roleId.add(new Role(roleObj.getId()));

		// roleId.add(new Role(roleObj.getId()));
		roleId.addAll(userForm.getRoles());

		User userExits = userService.findByUsername(userForm.getUsername());
		if (userExits == null) {
			userForm.setStatus(1);
			userForm.setRoles(roleId);
			userService.save(userForm);
			status = 1;
		}

		req.getSession().setAttribute("status", status);
		return "redirect:/getuser";
	}

	/**
	 * @param model
	 * @param error
	 * @param logout
	 * @return
	 */
	@GetMapping("/login")
	public String login(Model model, HttpServletRequest request, String error, String logout) {
		if (error != null) {
			model.addAttribute("error", "Your username and password is invalid.");
		}
		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");
		request.getSession().removeAttribute("credentialError");
		return "login";
	}

	/**
	 * @param model
	 * @return
	 */
	@GetMapping({ "/", "/welcome" })
	public String welcome(Model model, HttpServletRequest request) {
		return "welcome";
	}

	@ResponseBody
	@GetMapping("userrank" + "/{userid}")
	public List<Map<String, Object>> ListUserRank(@PathVariable("userid") Long userid) {
		System.out.println("userrank === userid : " + userid);
		return userService.userRankList(userid);
	}

	@ResponseBody
	@GetMapping("leadersv1" + "/{userid}/{filterid}/{fetch}")
	public List<Map<String, Object>> leadersv1(@PathVariable("userid") Long userid,
			@PathVariable("filterid") Long filterid, @PathVariable("fetch") int fetch) {
		System.out.println("leadersv1= userid:" + userid + " filterid:" + filterid + " fetch:" + fetch);
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> response = new HashMap<>();
		int day = 1;
		if (filterid == 2)
			day = 7;
		else if (filterid == 3)
			day = 31;
		else
			day = 300;

		List<Map<String, Object>> listMapIn = userService.leadersBoardData(day, fetch);
		List<Map<String, Object>> listMapOut = new ArrayList<>();
		int rank = 0;
		int temp = 0, prev = 0;
		for (Map<String, Object> usr : listMapIn) {
			Map<String, Object> map = new HashMap<>();
			map.put("score", usr.get("dailyscore"));
			temp = Integer.parseInt(usr.get("dailyscore").toString());
			if (prev != temp) {
				prev = temp;
				rank++;
			}
			System.err.println("score : " + temp + " rank : " + (fetch + rank));
			map.put("rank", fetch + rank);
			map.put("name", usr.get("aliasname") == null ? usr.get("firstname") : usr.get("aliasname"));
			map.put("city", usr.get("city"));
			listMapOut.add(map);
		}
		response.put("leadersList", listMapOut);
		list.add(response);
		return list;
	}
	@ResponseBody
	@GetMapping("search" + "/{keyword}")
	public List<Map<String, Object>> search(@PathVariable("keyword") String keyword) {
		System.out.println("search === keyword : " + keyword);
		return userService.searchInArticle(keyword);
	}

}
