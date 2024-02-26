package com.example.vet.service.work.eSign;

import com.example.vet.model.SignDocument;
import com.example.vet.repository.work.eSign.eSign_Repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@Service
public class eSign_Service {

    private final eSign_Repository esRepository;

    public eSign_Service(eSign_Repository esRepository) {
        this.esRepository = esRepository;
    }

    public List<SignDocument> Select(int userPK) {
        List<SignDocument> docList = new ArrayList<>();
        docList = esRepository.Select(userPK);
        return docList;
    }

}
