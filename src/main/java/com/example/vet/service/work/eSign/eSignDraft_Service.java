package com.example.vet.service.work.eSign;

import com.example.vet.controller.work.eSign.SignMapper;
import com.example.vet.model.MasterVO;
import com.example.vet.model.Member;
import com.example.vet.model.Sign;
import com.example.vet.model.SignAdopt;
import com.example.vet.model.adopt.MissedAnimal;
import com.example.vet.repository.work.eSign.eSignDraft_Repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class eSignDraft_Service {
    private final eSignDraft_Repository eSignDraft_repository;

    @Autowired
    private SignMapper signMapper;

    public eSignDraft_Service(eSignDraft_Repository eSignDraft_repository, SignMapper signMapper) {
        this.eSignDraft_repository = eSignDraft_repository;
    }

    // 결재 라인 조회
    public List<Member> findLine() {
        List<Member> lineList = new ArrayList<>();
        lineList = eSignDraft_repository.findLine();
        return lineList;
    }

    // 유기동물 조회
    public List<MissedAnimal> selectAbandon() {
        List<MissedAnimal> abandonList;
        abandonList = eSignDraft_repository.selectAbandon();
        return abandonList;
    }

    // 입양자 조회
    public List<MasterVO> selectAdopter() {
        List<MasterVO> aList = null;
        aList = eSignDraft_repository.selectAdopter();
        return aList;
    }
    
    // 기안서 조회
    public List<Sign> selectDetail(int draftPk) {
        List<Sign> draftDetail;
        draftDetail = eSignDraft_repository.selectDetail(draftPk);
        return draftDetail;
    }

    // pk 추출
    @Transactional
    public Sign createSign(Sign sign) {
        Sign insertedSign = eSignDraft_repository.insertDraft(sign);
        int generatedSignPk = insertedSign.getSign_pk();
        log.info("트랜잭션 서비스" + generatedSignPk);
        eSignDraft_repository.insertDraftLine(generatedSignPk);
        return sign;
    }

    public int insertAdoptDraft(SignAdopt signAdopt) {
        int result = eSignDraft_repository.insertAdoptDraft(signAdopt);
        log.info(String.valueOf(result));
        return result;

    }
}
