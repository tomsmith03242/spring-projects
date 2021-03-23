package com.YoungTigers.tekko;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import com.YoungTigers.tekko.service.UserService;
@Configuration
public class AuthenticationSuccessWithSessionHandler extends SavedRequestAwareAuthenticationSuccessHandler implements AuthenticationSuccessHandler, LogoutSuccessHandler {
	@Autowired
	private UserService userService;
    public static final String username = "username";
    public static final String userid = "userid";
    public static final String authorities = "authorities";
    public static final String userIsEnabled = "userIsEnabled";
    public static final String error = "error";
    
	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		request.getSession().removeAttribute(username);
		request.getSession().removeAttribute(authorities);
		request.getSession().removeAttribute(userid);
		request.getSession().removeAttribute(userIsEnabled);
		request.getSession().removeAttribute(error);
	}

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		 	super.onAuthenticationSuccess(request, response, authentication);
		 	User userdetails = (User) authentication.getPrincipal();	
		   	com.YoungTigers.tekko.entites.User loggedInUser = userService.findByUsername(userdetails.getUsername());
		    request.getSession().setAttribute(userid, loggedInUser.getId());
		    request.getSession().setAttribute(userIsEnabled, loggedInUser.isEnabled()); 
	        request.getSession().setAttribute(username, userdetails.getUsername());
		 	request.getSession().setAttribute(authorities, userdetails.getAuthorities());
		
	}
}
