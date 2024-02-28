package com.example.vet.service.myPage;

import com.example.vet.model.Member;
import com.example.vet.repository.myPage.myDetail_Repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class myDetail_Service {

    private final myDetail_Repository myDetail_repository;

    public myDetail_Service(myDetail_Repository myDetail_repository) {
        this.myDetail_repository = myDetail_repository;
    }


    public List<Map<String, Object>> myDetailList(int userPk) {
        List<Map<String, Object>> myDetailList = null;
        myDetailList = myDetail_repository.myDetailList(userPk);
        return myDetailList;
    }
}
