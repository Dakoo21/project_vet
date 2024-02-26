package com.example.vet.service.work;

import com.example.vet.repository.work.DIAG_Repository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class DIAG_Service {
    private final DIAG_Repository diagRepository;

    public DIAG_Service(DIAG_Repository diagRepository) {
        this.diagRepository = diagRepository;
    }

    public List<Map<String, Object>> Select(Map<String, Object> rmap) {
        return diagRepository.Select(rmap);
    }

    public void Insert(Map<String, Object> rmap) {
        diagRepository.Insert(rmap);
    }

    public int SelectCost(Map<String, Object> servicePk) {
        return diagRepository.SelectCost(servicePk);
    }

    public void Update(Map<String, Object> rmap) {
        diagRepository.Update(rmap);
    }
}
