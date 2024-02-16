package com.example.vet.config.auth;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;


//객체가 없어서 에러발생 => 추후 수정 예정
@Data
public class PrincipalDetails /*implements UserDetails, OAuth2User*/ {

    //model 객체 없음
    //private Member member;
    private Map<String, Object> attribute;

    //일반 로그인시
//    public PrincipalDetails(Member member) {
//        this.member = member;
//    }
//
//
//    //구글 로그인시
//    public PrincipalDetails(Member member, Map<String, Object> attribute) {
//        this.member = member;
//        this.attribute = attribute;
//    }
//
//
//    //계정이 가지고 있는 권한 정보를 나타내는 메서드. Spring Security 의 GrantedAuthority 컬렉션을 반환
//    @Override
//    //계정이 가지고 있는 권한 정보를 반환하는 역할 담당
//    //GrantedAuthority 인터페이스의 의미는 Spring Security 에서 권한 정보를 표현하기 위한 것
//    public Collection<? extends GrantedAuthority> getAuthorities() {
//        //GrantedAuthority 인터페이스를 구현한 객체들을 저장하기 위한 ArrayList 객체를 생성
//        Collection<GrantedAuthority> collect = new ArrayList<>();
//        //GrantedAuthority 의 구현체를 생성하고, 해당 객체를 위에서 생성한 ArrayList 에 추가
//        collect.add(new GrantedAuthority() {
//            @Override
//            //GrantedAuthority 인터페이스의 getAuthority 메서드를 구현하여 해당 권한의 문자열 표현을 반환
//            public String getAuthority() {
//                return member.getRole();
//            }
//        });
//        //권한 정보가 담긴 ArrayList 을 반환
//        return collect;
//    }
//
//    // 세션에 담을 다른 컬럼 정보도 추가 가능하다.
//    //id 걊을 담는 메소드
//    public int getId(){
//        return member.getId();
//    }
//
//    //Email 값을 담는 메소드
//    public String getEmail(){
//        return member.getEmail();
//    }
//
//    //Role 값을 담는 메소드
//    public String getRole(){
//        return member.getRole();
//    }
//
//    //계정의 비밀번호를 반환하는 메서드
//    @Override
//    public String getPassword() {
//        return member.getPassword();
//    }
//
//    //계정의 사용자 이름을 반환하는 메서드
//    @Override
//    public String getUsername() {
//        return member.getUsername();
//    }
//
//    //계정이 만료되지 않았는지 여부를 나타내는 메서드.
//    @Override
//    public boolean isAccountNonExpired() {
//        return true;
//    }
//
//    //계정이 잠겨있지 않은지 여부를 나타내는 메서드
//    @Override
//    public boolean isAccountNonLocked() {
//        return true;
//    }
//
//    //계정의 자격 증명(비밀번호)이 만료되지 않았는지 여부를 나타내는 메서드
//    @Override
//    public boolean isCredentialsNonExpired() {
//        return true;
//    }
//
//    //계정이 활성화되어 있는지 여부를 나타내는 메서드
//    @Override
//    public boolean isEnabled() {
//        return true;
//    }
//
//    //구글 로그인후에 프로필 정보를 담을 변수
//    //{sub=구글에서 할당하는 나에대한 고유 식별자(숫자값), name=, picture=, email=, email_verified=, lokale=ko}
//    @Override
//    public Map<String, Object> getAttributes() {
//        return attribute;
//    }
//
//    @Override
//    public String getName() {
//        return null;
//    }
}
