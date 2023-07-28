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
                .requestMatchers("/guest*").hasAnyRole("ADMIN","GUEST")
                // .requestMatchers("/carInfor/map/selectSearch").authenticated() // 로그인 한 대상
                // .requestMatchers("/carInfor/map/*").hasRole("USER")
                .anyRequest().permitAll(); // 그외의 전체 대상

        httpSecurity.formLogin(login -> login.loginPage("/login2")
                .failureUrl("/login2?fail=true")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/main"));

                return httpSecurity.build();
        }
        @Bean
        public BCryptPasswordEncoder encoderPasswordEncoder() {
                return new BCryptPasswordEncoder();
        }
}

// uri에 마킹하는 부분
// admin으로 로그인 시도할 때 로그인 후 default된 화면으로 이어지면 안됨. admin페이지로 연결되어야 하는데 
// 스프링 자체에서 요청했던 부분을 기억하고 있다가 로그인 성공하면 그 해당 페이지롱 연결시켜줌.
/// admin* : uri에 admin으로 시작하는 모든 항목은 로그인이 필요하다 (*를 쓰면 모든 것을 포함함)
// 데이터베이스에는 ROLE_ 를 붙여줘야 하고 스프링에서는 roles를 굳이 붙이지 않아도 됨.(테이블 레코드에 있는 이름과 동일하게 넣어줘야 함)
// hasRole은 하나만 넣을 경우, hasAnyRole은 여러 권한을 나열할 수 있음.(전제: 데이터베이스에 있는 ROLE_)