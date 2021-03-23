package com.YoungTigers.tekko;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;

import com.YoungTigers.tekko.service.UserService;

@Configuration
public class CustomAuthenticationFailureHandler extends SimpleUrlAuthenticationFailureHandler
		implements AuthenticationFailureHandler {
	@Autowired
	private UserService userService;

	public static final String credentialError = "credentialError";
	public static final String userIsEnabled = "userIsEnabled";

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		super.onAuthenticationFailure(request, response, exception);
		com.YoungTigers.tekko.entites.User userDetails = null;
		String username = "";
		String getReqdevice = request.getHeader("User-agent");
		if (request != null) {
			username = request.getParameter("username");
		}
		if (request.getParameter("username") != null) {
			userDetails = userService.findByUsername(username); // TODO if userDetails is null
			if ((getReqdevice.toLowerCase().indexOf("android") >= 0)
					|| (getReqdevice.toLowerCase().indexOf("iphone") >= 0)
					|| (getReqdevice.toLowerCase().indexOf("Darwin") >= 0)) {
				if (userDetails != null) {
					request.getSession().setAttribute(userIsEnabled, userDetails.isEnabled());
				}
			} else {
				System.out.println("====customeAuth==i m web req=====");
				if (userDetails == null) {
					System.err.println(" user is not a valid user ");
					request.getSession().setAttribute(credentialError, "Invalid User!");
				} else {
					request.getSession().setAttribute(userIsEnabled, userDetails.isEnabled());
					if (userDetails.isEnabled()) {
						request.getSession().setAttribute(credentialError, "Username&password are not matching");
					} else {
						request.getSession().setAttribute(credentialError,
								"Your Account Is Expired Please Contact to Admin");
					}
				}
			}
		}
	}

}


