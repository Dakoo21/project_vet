package com.example.vet.repository.work.eSign;

import com.example.vet.model.SignDocument;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.List;

@Repository
@Slf4j
public class eSign_Repository {
    private final SqlSessionTemplate sqlSessionTemplate;

    public eSign_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<SignDocument> Select(int userPK) {
        List<SignDocument> docList= sqlSessionTemplate.selectList("selectDocs", userPK);
        return docList;
    }

}
