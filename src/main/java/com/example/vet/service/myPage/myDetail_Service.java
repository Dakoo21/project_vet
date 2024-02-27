package com.example.vet.service.myPage;

import com.example.vet.model.Member;
import com.example.vet.repository.myPage.myDetail_Repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class myDetail_Service {

    private final myDetail_Repository myDetail_repository;

    public myDetail_Service(myDetail_Repository myDetail_repository) {
        this.myDetail_repository = myDetail_repository;
    }

    public List<Member> myDetailList(int userPk) {
        log.info("내 정보 서비스 시작");
        List<Member> myDetailList;
        myDetailList = myDetail_repository.myDetailList(userPk);
        return myDetailList;
    }
}
