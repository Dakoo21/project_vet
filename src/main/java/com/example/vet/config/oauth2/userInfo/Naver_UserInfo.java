package com.example.vet.config.oauth2.userInfo;

import com.example.vet.common_Interface.Oauth2_Interface;
import lombok.AllArgsConstructor;

import java.util.Map;

//@AllArgsConstructor
public class Naver_UserInfo implements Oauth2_Interface {

    private Map<String, Object> attributes;

    @Override
    public String getProviderId() {
        return (String) ((Map) attributes.get("response")).get("id");
    }

    @Override
    public String getProvider() {
        return "Naver";
    }

    @Override
    public String getEmail() {
        return  (String) ((Map) attributes.get("response")).get("email");
    }

    @Override
    public String getName() {
        return (String) ((Map) attributes.get("response")).get("name");
    }
}
