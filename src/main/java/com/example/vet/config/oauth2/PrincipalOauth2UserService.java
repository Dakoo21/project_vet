package com.example.vet.config.oauth2;


import com.example.vet.common_Interface.Oauth2_Interface;
import com.example.vet.config.oauth2.userInfo.Google_UserInfo;
import com.example.vet.config.oauth2.userInfo.Kakao_UserInfo;
import com.example.vet.config.oauth2.userInfo.Naver_UserInfo;
import com.example.vet.model.User;
import com.example.vet.repository.SingUP_IN;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

import java.util.Map;


@Service
@Slf4j
public class PrincipalOauth2UserService extends DefaultOAuth2UserService {

    private final BCryptPasswordEncoder bCryptPasswordEncoder;
    private final SingUP_IN singUPIn;

    @Autowired
    public PrincipalOauth2UserService(BCryptPasswordEncoder bCryptPasswordEncoder, SingUP_IN singUPIn) {
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
        this.singUPIn = singUPIn;
    }


    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {

        OAuth2User oAuth2User = super.loadUser(userRequest);
        Oauth2_Interface oauth2_interface = null;
        log.info("getAtrributes : {}" , oAuth2User.getAttributes());

        String provider = userRequest.getClientRegistration().getRegistrationId();

        if(provider.equals("google")) {
            log.info("구글 로그인 요청");
            oauth2_interface = new Google_UserInfo( oAuth2User.getAttributes() );
        } else if(provider.equals("kakao")) {
            log.info("카카오 로그인 요청");
            oauth2_interface = new Kakao_UserInfo((Map)oAuth2User.getAttributes());
        }else if(provider.equals("naver")) {
            log.info("네이버 로그인 요청");
            oauth2_interface = new Naver_UserInfo( (Map)oAuth2User.getAttributes());
        }

        String USER_NM = oauth2_interface.USER_PROVIDER() + "-" + ;

        String providerId = oauth2_interface.getProviderId();
        String id = oAuth2UserInfo.getProvider() + "_" + providerId;
        log.info(id);
        String password = "123";
        String username =  oAuth2UserInfo.getName();
        log.info(username);
        String email = oAuth2UserInfo.getEmail();
        log.info(email);
        String role = "ROLE_USER";

        User userEmtity = null;

        try {
            memberEntity = joinDao.login(id);
            log.info("mEntity" + memberEntity);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if (memberEntity == null) { // 반환 받은 값이 없다 = username이 없으니까 강제 회원가입 처리
            try {
                log.info(providerId);
                log.info(id);
                log.info(username);
                log.info(email);
                memberEntity = Member.builder()
                        .username(username)
                        .password(password)
                        .email(email)
                        .role(role)
                        .provider(provider)
                        .providerid(providerId)
                        .build();

                joinDao.memberInsert(memberEntity);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            if(provider.equals("google")) {
                log.info("구글 로그인 한 적 있음");
            } else if(provider.equals("kakao")) {
                log.info("카카오 로그인 한 적 있음");
            }else if(provider.equals("naver")) {
                log.info("네이버 로그인 한 적 있음");
            }
        }

        return new PrincipalDetails(memberEntity, oAuth2User.getAttributes());
    }
}
