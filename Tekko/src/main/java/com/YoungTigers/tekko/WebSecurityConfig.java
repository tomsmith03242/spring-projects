package com.YoungTigers.tekko;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.header.writers.frameoptions.XFrameOptionsHeaderWriter;


@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    
	@Autowired
	DataSource dataSource;
	
	@Autowired
	AuthenticationSuccessWithSessionHandler successHandler;
	
	@Autowired
	CustomAuthenticationFailureHandler failureHandler;
	
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {	
		auth.jdbcAuthentication().dataSource(dataSource) 
			.passwordEncoder(bCryptPasswordEncoder())
			.usersByUsernameQuery("select username,password,enabled from users where username=?")
			.authoritiesByUsernameQuery("select u.username,r.name AS user_role from users u, users_role ur, role r where u.id=ur.users_id AND ur.role_id=r.id AND u.username=?"); 
	}	
    
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/addRoles").authenticated()
		.antMatchers("/getuser").authenticated()
				/* .antMatchers("/").authenticated() */
		.antMatchers("/role").authenticated()  
		.antMatchers("/*").permitAll()
			.and()
				.formLogin().loginPage("/login")
				.successHandler(successHandler)
			.and().formLogin().loginPage("/login").failureUrl("/login?error").failureHandler(failureHandler)  
			.and()
				.logout().logoutSuccessUrl("/login?logout").invalidateHttpSession(true)
			.permitAll().and().exceptionHandling().accessDeniedPage("/accessdenied").and().csrf().disable();     
        http
		   .headers()
		   .addHeaderWriter(new XFrameOptionsHeaderWriter(XFrameOptionsHeaderWriter.XFrameOptionsMode.SAMEORIGIN));
    }

    @Bean
    public AuthenticationManager customAuthenticationManager() throws Exception {
        return authenticationManager();
    }
    
}
