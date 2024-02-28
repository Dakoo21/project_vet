package com.example.vet.repository.myPage;

import com.example.vet.model.Member;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Slf4j
public class myDetail_Repository {

    private final SqlSessionTemplate sqlSessionTemplate;

    public myDetail_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<Map<String, Object>> myDetailList(int userPk) {
        List<Map<String, Object>> myDetailLisst = null;
        myDetailLisst = sqlSessionTemplate.selectList("myDetailList", userPk);
        return myDetailLisst;
    }

    public String PasswordCheckOut(Member member) {
        String userPassword;
        userPassword = sqlSessionTemplate.selectOne("passwordCheck", member);
        log.info(userPassword);
        return userPassword;
    }

    public int myDetailUpdate(Member member) {
        log.info("내 정보 업데이트 레포");
        int result;
        result = sqlSessionTemplate.update("myDetailUpdate", member);
        return result;
    }
}
