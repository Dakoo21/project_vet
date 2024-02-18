package com.example.vet.config.auth;

import com.example.vet.model.User;
import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

@Data
public class PrincipalDetails implements UserDetails, OAuth2User {

    private final User user;
    private final Map<String, Object> attribute;

    public PrincipalDetails(User user) {
        this.user = user;
        this.attribute = null;
    }

    public PrincipalDetails(User user, Map<String, Object> attribute) {
        this.user = user;
        this.attribute = attribute;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> authorities = new ArrayList<>();

        // 사용자의 권한을 설정하기 위해 공통 코드 테이블을 조회하여 해당 사용자의 권한을 가져옴
        Integer commonCodePk = user.getCOMMON_CODE_PK();
        if (commonCodePk != null) {
            // 공통 코드 테이블에서 해당 COMMON_CODE_PK를 가진 권한을 조회하여 권한을 부여
            // 여기서는 예시로 각 COMMON_CODE_PK에 대한 권한을 부여하는 코드를 작성
            switch (commonCodePk) {
                case 1:
                    authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
                    break;
                case 2:
                    authorities.add(new SimpleGrantedAuthority("ROLE_NURSE"));
                    break;
                case 3:
                    authorities.add(new SimpleGrantedAuthority("ROLE_INFO"));
                    break;
                case 4:
                    authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
                    break;
                default:
                    break;
            }
        }

        // 만약 COMMON_CODE_PK에 해당하는 권한이 없을 경우, 기본적으로 ROLE_USER를 추가하여 권한을 설정
        if (authorities.isEmpty()) {
            authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
        }

        return authorities;
    }


    // 세션에 담을 다른 컬럼 정보도 추가 가능하다.
    //id 걊을 담는 메소드
    public int getId(){
        return user.getUSER_PK();
    }

    //Email 값을 담는 메소드
    public String getEmail(){
        return user.getUSER_EMAIL();
    }

    //Role 값을 담는 메소드
    public String getRole(){
        return user.getCOMMON_CODE_PK().toString();
    }

    public String getPnumber() {
        return user.getUSER_PNUMBER();
    }

    public String getAddress() {
        return user.getUSER_ADDRESS();
    }

    public String getBdate() {
        return user.getUSER_BDATE();
    }

    public String getProvider(){
        return user.getUSER_PROVIDER();
    }

    public  String getProviderId() {
        return user.getUSER_PROVIDERID();
    }

    //계정의 비밀번호를 반환하는 메서드
    @Override
    public String getPassword() {
        return user.getUSER_PW();
    }

    //계정의 사용자 이름을 반환하는 메서드
    @Override
    public String getUsername() {
        return user.getUSER_USERNAME();
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

    @Override
    public String getName() {
        return null;
    }
}
