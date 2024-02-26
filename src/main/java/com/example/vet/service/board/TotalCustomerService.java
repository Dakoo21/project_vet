package com.example.vet.service.board;

import com.example.vet.model.MasterVO;
import com.example.vet.repository.board.TotalCustomer_Repository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
@Service
public class TotalCustomerService {
    Logger logger = LoggerFactory.getLogger(TotalCustomerService.class);
    private final TotalCustomer_Repository totalCustomer_repository;

    public TotalCustomerService(TotalCustomer_Repository totalCustomer_repository){
        this.totalCustomer_repository = totalCustomer_repository;
    }

    public List<Map<String, Object>>Select(MasterVO masterVO){
        List<Map<String, Object>> cList = new ArrayList<>();
        cList = totalCustomer_repository.Select(masterVO);
        logger.info(cList.toString());
        return cList;
    }
}