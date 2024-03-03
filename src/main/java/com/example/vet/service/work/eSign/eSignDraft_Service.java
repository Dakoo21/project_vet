package com.example.vet.service.work.eSign;

import com.example.vet.model.MasterVO;
import com.example.vet.model.Member;
import com.example.vet.model.SignDocument;
import com.example.vet.model.adopt.MissedAnimal;
import com.example.vet.repository.work.eSign.eSignDraft_Repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
public class eSignDraft_Service {
    private final eSignDraft_Repository eSignDraft_repository;
    public eSignDraft_Service(eSignDraft_Repository eSignDraft_repository) {
        this.eSignDraft_repository = eSignDraft_repository;
    }

    public List<MasterVO> selectAdopter() {
        List<MasterVO> aList = null;
        aList = eSignDraft_repository.selectAdopter();
        return aList;
    }

    public List<Member> findLine() {
        List<Member> lineList = new ArrayList<>();
        lineList = eSignDraft_repository.findLine();
        return lineList;
    }

    public List<MissedAnimal> selectAbandon() {
        List<MissedAnimal> abandonList;
        abandonList = eSignDraft_repository.selectAbandon();
        return abandonList;
    }
    public int insertDraft(SignDocument signDocument) {
        // List<MissedAnimal> abandonList;
        int result = eSignDraft_repository.insertDraft(signDocument);
        return result;
    }
    // 기안서 조회
    public List<SignDocument> selectDetail(int draftPk) {
        List<SignDocument> draftDetail;
        draftDetail = eSignDraft_repository.selectDetail(draftPk);
        return draftDetail;

    }
}
