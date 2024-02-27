package com.example.vet.repository.work.eSign;

import com.example.vet.model.eSign;
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

    public List<eSign> Select(int userPK) {
        List<eSign> docList = sqlSessionTemplate.selectList("selectDocs", userPK);
        return docList;
    }

}
