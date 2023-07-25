package com.the_glory.project_fitness.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        // None using csrf protection
        httpSecurity.csrf().disable();
        // 권한에 대한 부분 : url & roles : user url & roles
        // url, roles from Dao
        httpSecurity.authorizeHttpRequests() // 로그인
                // .requestMatchers("/manager*").hasAnyRole("ADMIN", "MANAGER") // DB에는 ROLE_ADMIN, ROLE_MANAGER 이러게 넣자.
                .requestMatchers("/guest*").hasAnyRole("ADMIN")
                // .requestMatchers("/carInfor/map/selectSearch").authenticated() // 로그인 한 대상
                // .requestMatchers("/carInfor/map/*").hasRole("USER")
                .anyRequest().permitAll(); // 그외의 전체 대상

        httpSecurity.formLogin(login -> login.loginPage("/login2")
                .failureUrl("/login2?fail=true")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/main"));

        httpSecurity.logout(logout -> logout
                .logoutSuccessUrl("/main")// 로그아웃이 성공하면 가야하는 경로(controller의 url)
                .invalidateHttpSession(true)
                .deleteCookies("JSESSIONID"));
                // 403white page 방어코드 
                // httpSecurity.exceptionHandling()
                // .accessDeniedPage("/home");

        return httpSecurity.build();
    }

    @Bean
    public BCryptPasswordEncoder encoderPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
