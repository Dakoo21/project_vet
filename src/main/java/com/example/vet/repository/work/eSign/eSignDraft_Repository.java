package com.example.vet.repository.work.eSign;

import com.example.vet.model.MasterVO;
import com.example.vet.model.Member;
import com.example.vet.model.SignDocument;
import com.example.vet.model.adopt.MissedAnimal;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Repository
@Slf4j
public class eSignDraft_Repository {
    private final SqlSessionTemplate sqlSessionTemplate;

    public eSignDraft_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<MasterVO> selectAdopter() {
        List<MasterVO> aList;
        aList = sqlSessionTemplate.selectList("selectAdopter");
        return aList;
    }

    public List<Member> findLine() {
        List<Member> lineList = new ArrayList<>();
        lineList = sqlSessionTemplate.selectList("selectLine");
        return lineList;
    }

    public List<MissedAnimal> selectAbandon() {
        List<MissedAnimal> abandonList = sqlSessionTemplate.selectList("selectAbandon");
        // selectList 메서드가 null을 반환하는 경우 널 체크
        if (abandonList == null) {
            return Collections.emptyList();
        }
        return abandonList;

    }

    public int insertDraft(SignDocument signDocument) {
        int result = sqlSessionTemplate.insert("insertDraft", signDocument);
        log.info(String.valueOf(result));
        return result;
    }

    public List<SignDocument> selectDetail(int draftPk) {
        List<SignDocument> draftDetail = sqlSessionTemplate.selectOne("selectDraftDetail");
        log.info(draftDetail.toString());
        return draftDetail;
    }
}
