package com.example.vet.config.oauth2.userInfo;

import com.example.vet.common_Interface.Oauth2_Interface;
import lombok.AllArgsConstructor;

import java.util.Map;

@AllArgsConstructor
public class Google_UserInfo implements Oauth2_Interface {

    private Map<String, Object> attributes;

    @Override
    public String USER_USERNAME() {
        return (String) attributes.get("name");
    }

    @Override
    public String USER_EMAIL() {
        return (String) attributes.get("email");
    }

    @Override
    public String USER_PROVIDER() {
        return "Google";
    }

    @Override
    public String USER_PROVIDERID() {
        return (String) attributes.get("sub");
    }
}
