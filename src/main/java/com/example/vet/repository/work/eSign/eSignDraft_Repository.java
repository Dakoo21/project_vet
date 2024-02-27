package com.example.vet.repository.work.eSign;

import com.example.vet.model.Member;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Repository
@Slf4j
public class eSignDraft_Repository {
    private final SqlSessionTemplate sqlSessionTemplate;

    public eSignDraft_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }
    public List<Member> findLine() {
        List<Member> lineList = new ArrayList<>();
        lineList = sqlSessionTemplate.selectList("selectLine");
        return lineList;
    }
}
