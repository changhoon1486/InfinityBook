package kr.co.book.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.DefaultSecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	@Bean
	public PasswordEncoder getPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public DefaultSecurityFilterChain filterChain(HttpSecurity http) 
			throws Exception {

//		//csrf 토큰 기능을 disable 처리 해 줘야 403(권한 에러)가 생기지 않는다.
//		//csrf(Cross Site Request Forgery) : 다른 사이트에서 내가 요청하지 않은 내용이 요청되는 해킹 방법
//		// 예 : fishing 사이트에 들어갔다가 어떤 js 가 받아졌는데, 이게 버튼에 어떤 명령어를 심어 원치않는 동작을 하게 됨
//		// 이걸 방지 하기 위해 csrf 토큰을 발행해 변조된 페이지 인지 확인하게 된다.

		return http.csrf().disable().build();
	}
	
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		 PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		 
	        auth.inMemoryAuthentication()
	            .withUser("user")
	            .password(encoder.encode("1234"))
	            .roles("USER");
	    }


	
	
	@Bean
	BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

}
