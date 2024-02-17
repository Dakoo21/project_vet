package com.example.vet.config.oauth2.userInfo;

import com.example.vet.common_Interface.Oauth2_Interface;
import lombok.AllArgsConstructor;

import java.util.Map;

//@AllArgsConstructor
public class Google_UserInfo implements Oauth2_Interface {

    private Map<String, Object> attributes;
    @Override
    public String getProviderId() {
        return (String) attributes.get("sub");
    }

    @Override
    public String getProvider() {
        return "google";
    }

    @Override
    public String getEmail() {
        return (String) attributes.get("email");
    }

    @Override
    public String getName() {
        return (String) attributes.get("name");
    }
}
