package tw.ispan.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import tw.ispan.account.AuthAccountDetailsService;

@EnableGlobalMethodSecurity(securedEnabled = true,prePostEnabled = true)
@EnableWebSecurity
public class WebSercurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private AuthAccountDetailsService myUserDetailService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		.userDetailsService(myUserDetailService)
		.passwordEncoder(new BCryptPasswordEncoder());
		
//		admin權限角色登入
		PasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
        auth.inMemoryAuthentication() 
        .passwordEncoder(pwdEncoder)
        .withUser("admin") 
        .password(pwdEncoder.encode("admin"))
        .roles("ADMIN");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests()
		.antMatchers(HttpMethod.GET, "/Store/**").authenticated()
		.antMatchers(HttpMethod.GET, "/Account/User1/**").hasAnyAuthority("ROLE_USER")
		.antMatchers(HttpMethod.GET, "/Account/**").authenticated()
		.antMatchers(HttpMethod.GET).permitAll()
		.antMatchers(HttpMethod.POST, "/Store/**").authenticated()
		.antMatchers(HttpMethod.GET, "/Account/User1/**").hasAnyAuthority("ROLE_USER")
		.antMatchers(HttpMethod.POST, "/Account/**").authenticated()
		.antMatchers(HttpMethod.POST).permitAll()
		
		//角色權限配置
        .antMatchers("/store/**").hasAuthority("ROLE_STORE") 
        
		.anyRequest().authenticated()
	.and()
		.rememberMe().tokenValiditySeconds(86400).key("rememberMe-key")
	.and()
		.csrf().disable()
		.formLogin().loginPage("/login/page")
		.defaultSuccessUrl("/Account/User1/membercenter.controller")  
		.failureUrl("/login/page?error=true")
	.and()
		.logout().logoutSuccessUrl("/login/page");
		
//		沒有權限時返回的頁面403
		http.exceptionHandling().accessDeniedPage("/403");
	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		
	}

}