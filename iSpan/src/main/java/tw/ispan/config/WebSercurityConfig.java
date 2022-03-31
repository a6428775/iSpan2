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
import org.springframework.security.web.authentication.rememberme.InMemoryTokenRepositoryImpl;

import tw.ispan.store.AuthStoreDetailsService;
import tw.ispan.user1.AuthUser1DetailsService;

@EnableGlobalMethodSecurity(securedEnabled = true,prePostEnabled = true)
@EnableWebSecurity
public class WebSercurityConfig extends WebSecurityConfigurerAdapter {
	
//	UserDetailsService 登入功能
//	@Autowired
//	private AuthStoreDetailsService myUserDetailService;

	@Autowired
	private AuthUser1DetailsService AuthUser1DetailsService;

	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//		密碼編碼
		auth
		.userDetailsService(AuthUser1DetailsService)
		.passwordEncoder(new BCryptPasswordEncoder());
		
//		admin權限角色登入
		PasswordEncoder pwdEncoder = new BCryptPasswordEncoder();
        auth.inMemoryAuthentication() 
        .passwordEncoder(pwdEncoder)
        .withUser("admin") 
        .password(pwdEncoder.encode("admin"))
        .roles("ADMIN", "MEMBER");
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.authorizeRequests()
			.antMatchers(HttpMethod.GET, "/Store/**").authenticated()
			.antMatchers(HttpMethod.GET, "/user1/**").authenticated()
			.antMatchers(HttpMethod.GET).permitAll()
			.antMatchers(HttpMethod.POST, "/Store/**").authenticated()
			.antMatchers(HttpMethod.POST, "/user1/**").authenticated()
			.antMatchers(HttpMethod.POST).permitAll()
			
			//角色權限配置
            .antMatchers("/admin/**").hasAuthority("ROLE_ADMIN") 
//            .antMatchers("/manager_2").hasAnyAuthority("ADMIN,MANAGER")
//            .antMatchers("/admin/**").hasRole("ADMIN")
//            .antMatchers("/role").hasAnyRole("Sale")
            .anyRequest().authenticated() 
		.and()
			.rememberMe().tokenValiditySeconds(86400).key("rememberMe-key")              
		.and()         
			.csrf().disable()
			.formLogin().loginPage("/login/page")
//			.defaultSuccessUrl("/login/welcome")  //welcome
			.defaultSuccessUrl("/user1/membercenter.controller")  
			.failureUrl("/login/page?error=true")
		.and()
			.logout().invalidateHttpSession(true) //設定登出後是否要註銷 HttpSession，預設為 true
			.logoutSuccessUrl("/login/page");
		
//		沒有權限時返回的頁面403
		http.exceptionHandling().accessDeniedPage("/403");
	}
		
	@Override
	public void configure(WebSecurity web) throws Exception {
	}

}