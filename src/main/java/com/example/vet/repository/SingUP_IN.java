package com.example.vet.repository;

import com.example.vet.model.User;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class SingUP_IN {


    private final SqlSessionTemplate sqlSessionTemplate;

    public SingUP_IN(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public int userInsert(User user) {
        int result;
        result = sqlSessionTemplate.insert("userInsert", user);
        return result;
    }

    public User login(String userNm) {
        User user = null;
        try {
            user = sqlSessionTemplate.selectOne("login", userNm);
        } catch (Exception e) {
            throw e;
        }
        return user;
    }
}
