package com.example.vet.repository;

import com.example.vet.model.Member;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
@Slf4j
public class Login_repository {
    private final SqlSessionTemplate sqlSessionTemplate;

    public Login_repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public Member login(String MEMBER_ID) {
        Member member = null;
        log.info("login_repository 시작");
        log.info(MEMBER_ID);
        try {
            member = sqlSessionTemplate.selectOne("login", MEMBER_ID);
            log.info(member.toString());
        } catch (Exception e) {
            log.info(e.toString());
        }
        return member;
    }

    public int memberInsert(Member member) {
        log.info("login_repository memberInsert 시작");
        log.info(member.toString());
        int result;
        result = sqlSessionTemplate.insert("memberInsert", member);
        log.info("login_repository memberInsert 끝");
        return result;
    }

    public int checkId(String id) {
        int result;
        result = sqlSessionTemplate.selectOne("checkId", id);
        return result;
    }

    public String findID(Member member) {
        log.info("아이디 찾기 레포");
        String userID;
        userID = sqlSessionTemplate.selectOne("findID", member);
        return userID;
    }

    public String findPassword(Member member) {
        log.info("비밀번호 찾기 레포");
        String userPasswoard;
        userPasswoard = sqlSessionTemplate.selectOne("findPassword", member);
        return userPasswoard;
    }

    public int userPasswordUpdate(Member member) {
        int result;
        result = sqlSessionTemplate.update("userPasswordUpdate", member);
        return result;
    }
}
