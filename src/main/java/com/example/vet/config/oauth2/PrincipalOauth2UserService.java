package com.example.vet.config.oauth2;

import com.example.vet.common_Interface.Oauth2_Interface;
import com.example.vet.config.auth.PrincipalDetails;
import com.example.vet.config.oauth2.userInfo.Google_UserInfo;
import com.example.vet.config.oauth2.userInfo.Kakao_UserInfo;
import com.example.vet.config.oauth2.userInfo.Naver_UserInfo;
import com.example.vet.model.Member;
import com.example.vet.repository.Login_repository;
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

    private final Login_repository login_repository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public PrincipalOauth2UserService(Login_repository login_repository, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.login_repository = login_repository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oAuth2User = super.loadUser(userRequest);
        Oauth2_Interface oauth2_interface =null;

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
            log.info(oauth2_interface.USER_EMAIL());
            log.info(oauth2_interface.USER_USERNAME());
            log.info(oauth2_interface.USER_PROVIDER());
            log.info(oauth2_interface.USER_PROVIDERID());
        }

        String PROVIDERID = oauth2_interface.USER_PROVIDERID();
        String MEMBER_ID = oauth2_interface.USER_PROVIDER() + "_" + PROVIDERID;
        String MEMBER_PW = bCryptPasswordEncoder.encode("비밀번호가 필요해");
        String MEMBER_MEMBERNAME = oauth2_interface.USER_USERNAME();
        String MEMBER_EMAIL = oauth2_interface.USER_EMAIL();
        String MEMBER_ROLE = "ROLE_USER";

        Member memberEntity = null;

        try {
            memberEntity = login_repository.login(MEMBER_ID);
            log.info("mEntity" + memberEntity);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if (memberEntity == null) {
            try {
                memberEntity = Member.builder()
                                .MEMBER_ID(MEMBER_ID)
                                .MEMBER_PW(MEMBER_PW)
                                .MEMBER_MEMBERNAME(MEMBER_MEMBERNAME)
                                .MEMBER_EMAIL(MEMBER_EMAIL)
                                .MEMBER_ROLE(MEMBER_ROLE)
                                .PROVIDER(provider)
                                .PROVIDERID(PROVIDERID)
                                .build();
                login_repository.memberInsert(memberEntity);
            } catch (Exception e) {
                throw new RuntimeException(e);
            }

        }else {
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
