package com.example.vet.config.oauth2.userInfo;

import com.example.vet.common_Interface.Oauth2_Interface;
import lombok.AllArgsConstructor;

import java.util.Map;

@AllArgsConstructor
public class Naver_UserInfo implements Oauth2_Interface {

    private Map<String, Object> attributes;

    @Override
    public String USER_USERNAME() {
        return (String) ((Map) attributes.get("response")).get("name");
    }

    @Override
    public String USER_EMAIL() {
        return  (String) ((Map) attributes.get("response")).get("email");
    }

    @Override
    public String USER_PROVIDER() {
        return "Naver";
    }

    @Override
    public String USER_PROVIDERID() {
        return (String) ((Map) attributes.get("response")).get("id");
    }
}
