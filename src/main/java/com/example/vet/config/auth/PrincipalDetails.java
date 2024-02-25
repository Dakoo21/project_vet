package com.example.vet.config.auth;

import com.example.vet.model.Member;
import lombok.Data;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

@Data
@Slf4j
public class PrincipalDetails implements UserDetails, OAuth2User {

    private Member member;
    private Map<String, Object> attribute;

    public PrincipalDetails(Member member) {
        this.member = member;
    }

    public PrincipalDetails(Member member, Map<String, Object> attribute) {
        this.member = member;
        this.attribute = attribute;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> collect = new ArrayList<>();
        collect.add(new GrantedAuthority() {
            @Override
            public String getAuthority() {
                return member.getMEMBER_ROLE();
            }
        });
        return collect;
    }

    //세션에 담아둘 값

    public Integer getID() {
        return member.getMEMBER_PK();
    }

    //사용자 성명
    public String getName() {
        return member.getMEMBER_MEMBERNAME();
    }
    //사용자 이메일
    public String getEmail() {
        return member.getMEMBER_EMAIL();
    }
    //사용자 권한
    public String getRole() {
        return member.getMEMBER_ROLE();
    }


    @Override
    public String getPassword() {
        return member.getMEMBER_PW();
    }

    @Override
    public String getUsername() {
        return member.getMEMBER_ID();
    }

    //계정이 만료되지 않았는지 여부를 나타내는 메서드.
    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    //계정이 잠겨있지 않은지 여부를 나타내는 메서드
    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    //계정의 자격 증명(비밀번호)이 만료되지 않았는지 여부를 나타내는 메서드
    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    //계정이 활성화되어 있는지 여부를 나타내는 메서드
    @Override
    public boolean isEnabled() {
        return true;
    }

    //구글 로그인후에 프로필 정보를 담을 변수
    //{sub=구글에서 할당하는 나에대한 고유 식별자(숫자값), name=, picture=, email=, email_verified=, lokale=ko}
    @Override
    public Map<String, Object> getAttributes() {
        return attribute;
    }
}
