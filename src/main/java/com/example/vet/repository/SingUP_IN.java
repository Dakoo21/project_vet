package com.example.vet.repository;

import com.example.vet.model.User;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
@Slf4j
public class SingUP_IN {

    private final SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    public SingUP_IN(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public int userInsert(User user) {
        int result;
        result = sqlSessionTemplate.insert("userInsert", user);
        return result;
    }

    public User login(String USER_NM) {
        User user = null;
        try {
            user = sqlSessionTemplate.selectOne("login", USER_NM);
        } catch (Exception e) {
            // 예외를 적절하게 로깅하거나 처리할 수 있도록 합니다.
            log.error("An error occurred while trying to log in with username: {}", USER_NM, e);
            // 예외를 RuntimeException으로 감싸서 다시 던집니다.
            throw new RuntimeException("Failed to login with username: " + USER_NM, e);
        }
        return user;
    }
}
