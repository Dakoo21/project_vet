package com.example.vet.repository.board;

import com.example.vet.model.Notice;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@Slf4j
public class Notice_Board_Repository {

    private final SqlSessionTemplate sqlSessionTemplate;

    public Notice_Board_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public int noticeInsert(Notice notice) {
        int result;
        result = sqlSessionTemplate.insert("noticeInsert", notice);
        return result;
    }
}
