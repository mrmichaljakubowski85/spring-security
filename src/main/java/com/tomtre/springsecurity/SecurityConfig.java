package com.tomtre.springsecurity;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        User.UserBuilder users = User.withDefaultPasswordEncoder();

        auth.inMemoryAuthentication()
                .withUser(users.username("tom").password("test123").roles(SecurityRoles.EMPLOYEE))
                .withUser(users.username("mary").password("test123").roles(SecurityRoles.MANAGER, SecurityRoles.EMPLOYEE))
                .withUser(users.username("susan").password("test123").roles(SecurityRoles.ADMIN, SecurityRoles.EMPLOYEE));
    }

    //https://www.baeldung.com/registration-with-spring-mvc-and-spring-security
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                    .antMatchers("/").hasRole(SecurityRoles.EMPLOYEE)
                    .antMatchers("/leaders/**").hasRole(SecurityRoles.MANAGER)
                    .antMatchers("/systems/**").hasRole(SecurityRoles.ADMIN)
                .and()
                    .formLogin()
                    .loginPage("/login-page")
                    .loginProcessingUrl("/authenticate-user")
                    .permitAll()
                .and()
                    .logout()
                    .permitAll()
                .and()
                    .exceptionHandling()
                    .accessDeniedPage("/access-denied");

    }
}
