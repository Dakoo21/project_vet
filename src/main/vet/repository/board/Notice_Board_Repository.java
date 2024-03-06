package com.example.vet.repository.board;

import com.example.vet.model.Notice;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Slf4j
public class Notice_Board_Repository {

    private final SqlSessionTemplate sqlSessionTemplate;

    public Notice_Board_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<Notice> noticeList(Notice notice) {
        List<Notice> noticeList;
        noticeList = sqlSessionTemplate.selectList("noticeList", notice);
        return noticeList;
    }
    public int hitCount(Notice notice) {
        int result;
        result = sqlSessionTemplate.update("hitCount", notice);
        return result;
    }

    public int noticeInsert(Notice notice) {
        int result;
        result = sqlSessionTemplate.insert("noticeInsert", notice);
        return result;
    }

    public int noticeUpdate(Notice notice) {
        int result;
        result = sqlSessionTemplate.update("noticeUpdate", notice);
        return result;
    }

    public int noticeDelete(int notice_pk) {
        int result;
        result = sqlSessionTemplate.delete("noticeDelete", notice_pk);
        return result;
    }

}
