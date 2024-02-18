package com.example.vet.config.oauth2;


import com.example.vet.common_Interface.Oauth2_Interface;
import com.example.vet.config.auth.PrincipalDetails;
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

        String USER_PROVIDER = userRequest.getClientRegistration().getRegistrationId();

        if(USER_PROVIDER.equals("google")) {
            log.info("구글 로그인 요청");
            oauth2_interface = new Google_UserInfo( oAuth2User.getAttributes() );
        } else if(USER_PROVIDER.equals("kakao")) {
            log.info("카카오 로그인 요청");
            oauth2_interface = new Kakao_UserInfo((Map)oAuth2User.getAttributes());
        }else if(USER_PROVIDER.equals("naver")) {
            log.info("네이버 로그인 요청");
            oauth2_interface = new Naver_UserInfo( (Map)oAuth2User.getAttributes());
        }

        String USER_PROVIDERID = oauth2_interface.USER_PROVIDERID();
        String USER_NM = oauth2_interface.USER_PROVIDER() + "-" + USER_PROVIDERID;
        String USER_PW = bCryptPasswordEncoder.encode("패스워드");
        String USER_USERNAME =  oauth2_interface.USER_USERNAME();
        String USER_EMAIL = oauth2_interface.USER_EMAIL();

        User userEmtity = null;

        try {
            userEmtity = singUPIn.login(USER_NM);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if (userEmtity == null) { // 반환 받은 값이 없다 = username이 없으니까 강제 회원가입 처리
            try {
                userEmtity = User.builder()
                        .USER_NM(USER_NM)
                        .USER_USERNAME(USER_USERNAME)
                        .USER_EMAIL(USER_EMAIL)
                        .USER_PW(USER_PW)
                        .COMMON_CODE_PK(4) // 또는 다른 적절한 COMMON_CODE_PK 값
                        .USER_PROVIDER(USER_PROVIDER)
                        .USER_PROVIDERID(USER_PROVIDERID)
                        .build();

                singUPIn.userInsert(userEmtity);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        } else {
            if(USER_PROVIDER.equals("google")) {
                log.info("구글 로그인 한 적 있음");
            } else if(USER_PROVIDER.equals("kakao")) {
                log.info("카카오 로그인 한 적 있음");
            }else if(USER_PROVIDER.equals("naver")) {
                log.info("네이버 로그인 한 적 있음");
            }
        }

        return new PrincipalDetails(userEmtity, oAuth2User.getAttributes());
    }
}
