package spr.boot.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import spr.boot.model.AuthUserDetailsService;

@EnableWebSecurity
public class WebSercurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	private AuthUserDetailsService myuserDetailsService;
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth
		.userDetailsService(myuserDetailsService)
		.passwordEncoder(new BCryptPasswordEncoder());
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		.authorizeRequests() //說明要限定授權範圍的請求
		.antMatchers(HttpMethod.GET, "/users/**").authenticated()
		.antMatchers(HttpMethod.GET).permitAll() //permitAll():表示除前面限制外，其他所有GET請求無條件允許呼叫執行
		.antMatchers(HttpMethod.POST, "/users/**").authenticated()
		.antMatchers(HttpMethod.POST).permitAll()
		.anyRequest().authenticated() //anyRequest()表示限定任何請求都要求authenticated()驗證，會對剩下的進行設定
		.and()
		.rememberMe().tokenValiditySeconds(86400).key("rememberMe-key") //rememberMe(): 透過此記得我功能在驗證後以Cookie方式儲存至瀏覽器
		.and()
		.csrf().disable() //用來設定為不使用CSRF防跨站請求偽造防護
		.formLogin().loginPage("/login/page")
		.defaultSuccessUrl("/login/welcome");
		

	}

	@Override
	public void configure(WebSecurity web) throws Exception {
		
	}

}