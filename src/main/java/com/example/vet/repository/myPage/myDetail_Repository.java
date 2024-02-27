package com.example.vet.repository.myPage;

import com.example.vet.model.Member;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Slf4j
public class myDetail_Repository {

    private final SqlSessionTemplate sqlSessionTemplate;

    public myDetail_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<Member> myDetailList(int userPk) {
        List<Member> myDetailList;
        myDetailList = sqlSessionTemplate.selectOne("myDetailList", userPk);
        return myDetailList;
    }
}
