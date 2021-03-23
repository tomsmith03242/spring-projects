package com.YoungTigers.tekko;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomErrorController implements ErrorController {

	private static final String PATH = "/error";

	@RequestMapping(value = PATH)
	public String error(HttpServletRequest req, HttpServletResponse res) {
		return "login";
	}

	@Override
	public String getErrorPath() {
		return PATH;
	}
}

