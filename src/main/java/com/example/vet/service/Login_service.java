package com.example.vet.service;

import com.example.vet.model.Member;
import com.example.vet.repository.Login_repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@Slf4j
public class Login_service {

    private final Login_repository login_repository;

    public Login_service(Login_repository login_repository) {
        this.login_repository = login_repository;
    }

    public int memberinsert(Member member) {
        log.info("login_service 시작");
        int result;
        result = login_repository.memberInsert(member);
        log.info("login_service 끝");
        return result;
    }

    public int checkId(String id) {
        int result;
        result = login_repository.checkId(id);
        return result;
    }

    public String findID(Member member) {
        log.info("아이디 찾기 서비스");
        String userID;
        userID = login_repository.findID(member);
        return userID;
    }

    public String findPassword(Member member) {
        log.info("비밀번호 찾기 서비스");
        String userPassword;
        userPassword = login_repository.findPassword(member);
        return userPassword;
    }

    public void userPasswordUpdate(Member member) {
        int result;
        boolean isOK;
        result = login_repository.userPasswordUpdate(member);
        if (result == 1) {
            isOK = true;
        } else {
            isOK = false;
        }
    }
}
