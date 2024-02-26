package com.example.vet.config;

import com.example.vet.config.oauth2.PrincipalOauth2UserService;
import jakarta.servlet.DispatcherType;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity
public class SecurityConfig {

    private final PrincipalOauth2UserService principalOauth2UserService;

    public SecurityConfig(PrincipalOauth2UserService principalOauth2UserService) {
        this.principalOauth2UserService = principalOauth2UserService;
    }

    @Bean
    //객체를 반환하는 public, static 메서드 선언
    public static BCryptPasswordEncoder bCryptPasswordEncoder(){
        //새로운 BCryptPasswordEncoder 객체를 생성하고 반환
        return new BCryptPasswordEncoder();
    }

    //아래 코드는 인증문제로 페이지가 열릴 때 정적내용은 적용을 하라는 메소드
    @Bean
    // WebSecurityCustomizer를 반환하는 메소드를 정의하겠다 라는 의미
    public WebSecurityCustomizer webSecurityCustomizer() {
        //(web)은 람다 표현식으로 이것을 사용하여 WebSecurity 객체를 조작하겠다는 의미
        //web.ignoring()는 WebSecurity에서 일부 설정을 무시하도록 지시하는 메소드
        return (web) -> web.ignoring()
                //정적 자원에 대한 요청을 처리하기 위한 매처(matcher)를 설정
                //기본적으로 정적 자원(CSS/image/JS 등등)들이 위치하는 특정 경로들에 대한 요청을 처리하도록 지시
                .requestMatchers("/build/**", "/css/**", "/dist/**", "/docs/**", "/img/**", "/page/**", "/plugins/**");
    }

    @Bean
    RoleHierarchy roleHierarchy () {
        RoleHierarchyImpl roleHierarchy = new RoleHierarchyImpl();
        roleHierarchy.setHierarchy("ROLE_ADMIN > ROLE_MASTER > ROLE_NURSE > ROLE_INFO > ROLE_USER");
        return roleHierarchy;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
        httpSecurity
                .csrf(AbstractHttpConfigurer::disable)
                //스프링 시큐리티에서 HTTP 요청을 인가(authorize)하는 부분
                //dispatcherTypeMatchers(DispatcherType.FORWARD) 은 처리후 자원을 전달하는 방법을 의미
                //.permitAll() 모든 사용자에 대해서 허용한다는 의미
                .authorizeHttpRequests(requests -> requests.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                        // 스프링 시큐리티에서 HTTP 요청에 대한 인가 규칙을 정의하는 부분
                        // "/user/**" 패턴에 해당하는 URL은 인증된 사용자만 접근할 수 있도록 설정한 부분( 로그인이 필요한 URL이라고 정의한 것 )
                        .requestMatchers("/user/**").authenticated()
                        // "/teacher/**" 패턴에 해당하는 URL은 "TEACHER" 역할을 가진 사용자에게만 허용한다는 규칙
                        .requestMatchers("/info/**").hasRole("INFO")
                        // "/admin/**" 패턴에 해당하는 URL은 "ADMIN" 역할을 가진 사용자에게만 허용한다는 규칙.
                        .requestMatchers("/nurse/**").hasRole("NURSE")
                        // "/admin/**" 패턴에 해당하는 URL은 "ADMIN" 역할을 가진 사용자에게만 허용한다는 규칙
                        .requestMatchers("/master/**").hasRole("MASTER")
                        // "/admin/**" 패턴에 해당하는 URL은 "ADMIN" 역할을 가진 사용자에게만 허용한다는 규칙
                        .requestMatchers("/admin/**").hasRole("ADMIN")
                        // "/login" 경로는 모든 사용자에게 허용된다는 규칙 ( 로그인 페이지에 대한 접근을 모든 사용자가 할 수 있도록 허용한 것 )
                        .requestMatchers("/login", "/join", "/joinMember", "/checkId", "/findID", "/findid").permitAll()
                        // 위에서 지정한 URL 패턴 이외의 모든 요청은 인증된 사용자만 접근할 수 있도록 설정한 부분 (위에서 정의한 규칙("/login") 이외의 모든 요청은 로그인이 필요한 것으로 간주됨)
                        .anyRequest().authenticated())
                // 로그인에 대한 설정을 하는 부분
                // 폼 기반 인증을 해야하고 로그인을 하려면 "/login" URL을 타고 가라는 설정
                .formLogin(login -> login.loginPage("/login")
                        // 로그인 처리 URL을 "/loginProcess"로 설정 / 이 URL은 실제 로그인이 처리되는 곳을 의미
                        .loginProcessingUrl("/loginProcess")
                        //로그인 실패 시 사용자를 리다이렉트할 URL을 "/login-error"로 설정
                        .usernameParameter("MEMBER_ID")
                        .passwordParameter("MEMBER_PW")
                        .failureUrl("/login-error")
                        // 로그인 성공 시 기본적으로 사용자를 "/" (루트) 페이지로 이동시키도록 설정
                        // 매개변수인 true는 항상 이동시키라는 의미
                        .defaultSuccessUrl("/", true)
                        // "/login" 페이지 및 "/loginProcess" URL에 대한 접근 권한을 모든 사용자에게 허용한다는 규칙을 설정
                        // 이유는 로그인 페이지와 로그인 처리 URL은 누구나 접근해야 하기 때문에...
                        .permitAll())
                //OAuth 2.0 로그인이 발생하면 사용자 정보를 가져오기 위해 PrincipalOauth2UserService가 호출되어, 해당 사용자 정보를 기반으로 인증된 사용자로 처리 이후 로그인이 성공하면 지정된 성공 URL로 리다이렉트 됨
                //oauth2Login 메서드를 호출하여 OAuth 2.0 로그인을 설정
                //그인 페이지의 URL을 지정합니다. 사용자가 로그인을 시도하면 이 URL로 이동하여 로그인을 수행
                .oauth2Login(oauth -> oauth.loginPage("/login")
                        //OAuth 2.0에서 사용자 정보를 얻는 엔드포인트 및 사용자 정보를 처리하는 서비스를 설정
                        //userInfoEndpoint 메서드는 OAuth 2.0로부터 사용자 정보를 얻는 엔드포인트에 대한 설정을 제공
                        //.userService(principalOauth2UserService): 사용자 정보를 처리하는 서비스를 설정
                        .userInfoEndpoint(end -> end.userService(principalOauth2UserService)))
                // 로그아웃 대한 설정을 하는 부분
                .logout(logout -> logout
                        // 로그아웃이 성공적으로 이루어 졌을 때 이동되어지는 URL 경로 설정
                        .logoutSuccessUrl("/login")
                        .permitAll());
        // 설정이 왼료된 보안 규칙을 해당 객체에 반환함
        return httpSecurity.build();
    }
}
