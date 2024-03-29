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
import org.springframework.security.crypto.password.PasswordEncoder;
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
    public static BCryptPasswordEncoder bCryptPasswordEncoder(){
        return new BCryptPasswordEncoder();
    }

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.ignoring()
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
                .authorizeHttpRequests(requests -> requests.dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                        .requestMatchers("/user/**").authenticated()
                        .requestMatchers("/info/**").hasRole("INFO")
                        .requestMatchers("/nurse/**").hasRole("NURSE")
                        .requestMatchers("/master/**").hasRole("MASTER")
                        .requestMatchers("/admin/**").hasRole("ADMIN")
                        .requestMatchers("/login", "/join", "/joinMember", "/checkId", "/findID", "/findid", "/findPassword", "/findpasword").permitAll()
                        .anyRequest().authenticated())
                .formLogin(login -> login.loginPage("/login")
                        .loginProcessingUrl("/loginProcess")
                        .usernameParameter("MEMBER_ID")
                        .passwordParameter("MEMBER_PW")
                        .failureUrl("/login-error")
                        .defaultSuccessUrl("/", true)
                        .permitAll())
                .oauth2Login(oauth -> oauth.loginPage("/login")
                        .userInfoEndpoint(end -> end.userService(principalOauth2UserService)))
                .logout(logout -> logout
                        .logoutSuccessUrl("/login")
                        .permitAll());
        return httpSecurity.build();
    }
}
