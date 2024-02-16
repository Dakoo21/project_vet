package com.example.vet.config.auth;

import com.example.vet.repository.SingUP_IN;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class PrincipalDetailService implements UserDetailsService {
    private final SingUP_IN singUP_In;

    public PrincipalDetailService(SingUP_IN singUP_In) {
        this.singUP_In = singUP_In;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        log.info("joinLogic 대신 시큐리티가 PrincipalDetailService 태움");
        //Model 객체가 없어서 작업 못함
//        Member member = singUP_In.login(username);
//        if (member != null) {
//            log.info("PrincipalDetails 생성후 model 의 member 값을 담아 넘겨줌");
//            log.info(member.getUsername());
//            return new PrincipalDetails(member);
//        }
        return null;
    }
}
