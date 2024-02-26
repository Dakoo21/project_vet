package com.example.vet.repository.work.eSign;

import com.example.vet.model.QnaVO;
import com.example.vet.model.eSign;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class eSign_Repository {
    private final SqlSessionTemplate sqlSessionTemplate;

    public eSign_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<eSign> Select(int userPK) {
        List<eSign> docList= sqlSessionTemplate.selectList("selectDocs", userPK);
        return docList;
    }

}
