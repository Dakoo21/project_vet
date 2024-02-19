package com.example.vet.repository.board;

import com.example.vet.model.QnaVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class QA_Repository {
    Logger logger = LoggerFactory.getLogger(QA_Repository.class);
    private final SqlSessionTemplate sqlSessionTemplate;

    public QA_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<Map<String, Object>> Select(QnaVO qnaVO) {
        List<Map<String, Object>> nList= sqlSessionTemplate.selectList("selectNotice", qnaVO);
        logger.info(nList.toString());
        return nList;
    }


    public int Insert(QnaVO qnaVO) {
        int rowsInserted = sqlSessionTemplate.insert("insertNotice", qnaVO);
        return rowsInserted> 0 ? 1 : 0;
    }


    public int Update(QnaVO qnaVO) {
        int rowsAffected = sqlSessionTemplate.update("updateNotice", qnaVO);
        return rowsAffected > 0 ? 1 : 0;
    }



    public int Delete(int qnaPK) {
        int rowDeleted = sqlSessionTemplate.delete("deleteNotice", qnaPK);
        return rowDeleted>0 ? 1 : 0;
    }
}
