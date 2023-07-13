package com.foke.demo.config;

import org.springframework.boot.autoconfigure.security.servlet.PathRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.header.writers.frameoptions.XFrameOptionsHeaderWriter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import jakarta.servlet.DispatcherType;


@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true)
public class SecurityConfig{

   @Bean
   public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
       http
       .authorizeHttpRequests(
               authorize -> authorize
               .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll() // 포워드 접근 허용
               .requestMatchers(PathRequest.toStaticResources().atCommonLocations()).permitAll() // 정적 리소스 접근 허용
               .requestMatchers("/img/**", "/js/**", "/css/**", "/fonts/**", "/sass/**", "/chat/**").permitAll() // 소스 접근 허용
               .requestMatchers("/", "/menuList", "/noticeList", "/usepolicy", "/privacy", "/test").permitAll() // 해당 경로 모든 사용자에게 접근 허용
               .requestMatchers("/login/**", "/notice/list", "/notice/detail/**", "/notice/view", "/detail/view2").permitAll() // 위와 같음
               .requestMatchers("/admin/**").hasAnyRole("ADMIN", "MANAGER") // 해당 경로 관리자에게만 접근 허용 
               .requestMatchers("/member/**").hasRole("USER") // 해당 경로 유저에게만 접근 허용
               .anyRequest().authenticated()
           )  
       .csrf(cors -> cors
    		   .ignoringRequestMatchers(new AntPathRequestMatcher("/h2-console/**"))
//    		   .disable() // 뭐가 안 되실 경우 주석 해제 후 시도(2)
        )
       .headers(h -> h
               .addHeaderWriter(new XFrameOptionsHeaderWriter(
               XFrameOptionsHeaderWriter.XFrameOptionsMode.SAMEORIGIN))
        )
       .formLogin(fLogin -> fLogin
               .loginPage("/login/loginform")
               .defaultSuccessUrl("/")
               .usernameParameter("memberId")
               .passwordParameter("memberPw")
        )
       .logout(lo -> lo
               .logoutRequestMatcher(new AntPathRequestMatcher("/login/logout"))
               .logoutSuccessUrl("/")
               .invalidateHttpSession(true)
        );


       return http.build();
   }

   @Bean
   PasswordEncoder passwordEncoder() {
       return new BCryptPasswordEncoder();
   }

   @Bean
   AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
       return authenticationConfiguration.getAuthenticationManager();
   }
}
