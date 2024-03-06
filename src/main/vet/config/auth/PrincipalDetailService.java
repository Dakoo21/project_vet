package com.example.vet.config.auth;

import com.example.vet.model.Member;
import com.example.vet.repository.Login_repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class PrincipalDetailService implements UserDetailsService {

    private final Login_repository login_repository;

    public PrincipalDetailService(Login_repository login_repository) {
        this.login_repository = login_repository;
    }


    @Override
    public UserDetails loadUserByUsername(String MEMBER_ID) throws UsernameNotFoundException {
        log.info("PrincipalDetailService 시작");
        Member member = login_repository.login(MEMBER_ID);
        if (member != null) {
            log.info("PrincipalDetails 생성후 model 의 member 값을 담아 넘겨줌");
            log.info(member.getMEMBER_ID());
            return new PrincipalDetails(member);
        }
        return null;
    }
}
