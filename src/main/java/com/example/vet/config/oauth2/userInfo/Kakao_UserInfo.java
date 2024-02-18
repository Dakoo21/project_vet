package com.example.vet.config.oauth2.userInfo;

import com.example.vet.common_Interface.Oauth2_Interface;
import lombok.AllArgsConstructor;

import java.util.Map;

@AllArgsConstructor
public class Kakao_UserInfo implements Oauth2_Interface {

    private Map<String, Object> attributes;

    @Override
    public String USER_USERNAME() {
        return (String) ((Map) attributes.get("properties")).get("nickname");
    }

    @Override
    public String USER_EMAIL() {
        return (String) ((Map) attributes.get("kakao_account")).get("email");
    }

    @Override
    public String USER_PROVIDER() {
        return "Kakao";
    }

    @Override
    public String USER_PROVIDERID() {
        return attributes.get("id").toString();
    }
}
