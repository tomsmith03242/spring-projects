package com.YoungTigers.thleaf.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.YoungTigers.thleaf.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	UserService userService;

@GetMapping("/getusers") 
public String getUsers(Map<String,Object> map) {
	map.put("usersList", userService.findAll());
	System.out.println("getusers ==== ");
	return "users";
}
}
