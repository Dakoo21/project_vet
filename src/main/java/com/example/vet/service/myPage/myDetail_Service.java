package com.example.vet.service.myPage;

import com.example.vet.model.Member;
import com.example.vet.repository.myPage.myDetail_Repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class myDetail_Service {

    private final myDetail_Repository myDetail_repository;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public myDetail_Service(myDetail_Repository myDetail_repository, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.myDetail_repository = myDetail_repository;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    public List<Map<String, Object>> myDetailList(int userPk) {
        List<Map<String, Object>> myDetailList = null;
        myDetailList = myDetail_repository.myDetailList(userPk);
        return myDetailList;
    }


    public int passwordCheckOut(Member member) throws Exception{
        String rawPassword = member.getMEMBER_PW();
        String userPassword;
        int result;
        userPassword = myDetail_repository.PasswordCheckOut(member);
        log.info(userPassword);
        if (bCryptPasswordEncoder.matches(rawPassword, userPassword)) {
            result = 1;
        } else {
            result = 0;
        }
        return result;
    }

    public int myDetailUpdate(Member member) {
        log.info("내 정보 업데이트 서비스");
        int result;
        result = myDetail_repository.myDetailUpdate(member);
        return result;
    }


    public int passwordUpdate(Member member) {
        int result;
        result = myDetail_repository.passwordUpdate(member);
        return result;
    }
}
