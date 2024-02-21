package com.example.vet.service;

import com.example.vet.model.Member;
import com.example.vet.repository.Login_repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

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
}
