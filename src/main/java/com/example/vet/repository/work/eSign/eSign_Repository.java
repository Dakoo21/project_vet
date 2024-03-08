package com.example.vet.repository.work.eSign;

import com.example.vet.model.Sign;
import com.example.vet.model.SignTotal;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Slf4j
public class eSign_Repository {
    private final SqlSessionTemplate sqlSessionTemplate;

    public eSign_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<SignTotal> Select(int userPK) {
        List<SignTotal> docList = sqlSessionTemplate.selectList("selectSignDetails", userPK);
        return docList;
    }

    public List<SignTotal> selectProgressList(Integer userPK) {
        List<SignTotal> progressList = sqlSessionTemplate.selectList("selectProgressList", userPK);
        return progressList;
    }
}
