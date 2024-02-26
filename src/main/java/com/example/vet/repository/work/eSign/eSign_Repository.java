package com.example.vet.repository.work.eSign;

import com.example.vet.model.SignDocument;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
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
