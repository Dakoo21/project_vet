package com.example.vet.service.work.eSign;

import com.example.vet.model.Member;
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
    public List<Member> findLine() {
        List<Member> lineList = new ArrayList<>();
        lineList = eSignDraft_repository.findLine();
        return lineList;
    }
}