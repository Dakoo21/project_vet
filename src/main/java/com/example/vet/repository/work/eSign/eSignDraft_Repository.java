package com.example.vet.repository.work.eSign;

import com.example.vet.controller.work.eSign.SignMapper;
import com.example.vet.model.MasterVO;
import com.example.vet.model.Member;
import com.example.vet.model.Sign;
import com.example.vet.model.adopt.MissedAnimal;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Repository
@Slf4j
public class eSignDraft_Repository {
    private final SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    private SignMapper signMapper;

    public eSignDraft_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    // 입양자 조회
    public List<MasterVO> selectAdopter() {
        List<MasterVO> aList;
        aList = sqlSessionTemplate.selectList("selectAdopter");
        return aList;
    }

    // 유기동물 조회
    public List<MissedAnimal> selectAbandon() {
        List<MissedAnimal> abandonList = sqlSessionTemplate.selectList("selectAbandon");
        // selectList 메서드가 null을 반환하는 경우 널 체크
        if (abandonList == null) {
            return Collections.emptyList();
        }
        return abandonList;
    }

    // 결재 라인 조회
    public List<Member> findLine() {
        List<Member> lineList;
        lineList = sqlSessionTemplate.selectList("selectLine");
        return lineList;
    }

    // 기안서 상세 조회
    public List<Sign> selectDetail(int draftPk) {
        List<Sign> draftDetail = sqlSessionTemplate.selectOne("selectDraftDetail");
        log.info(draftDetail.toString());
        return draftDetail;
    }

    //
    public Sign insertDraft(Sign sign) {
        signMapper.insertSign(sign);
        return sign;
    }

    //
    public void insertDraftLine(int generatedSignPk) {
        sqlSessionTemplate.insert("insertDraftLine", generatedSignPk);
    }
}
