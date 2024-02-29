package com.example.vet.service.board;

import com.example.vet.repository.board.TotalData_Repository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class TotalDataService {
    Logger logger = LoggerFactory.getLogger(TotalDataService.class);
    @Autowired
    TotalData_Repository totalData_repository= null;


    public List<Map<String, Object>> dataList(Map<String, Object> pmap) {
        logger.info("dataList");
        List<Map<String, Object>> dList = new ArrayList<>();
        dList = totalData_repository.dataList(pmap);
        return dList;
    }

    public int dataUpdate(Map<String, Object> pmap) {
        logger.info("dataUpdate");
        int result = 0;
        result = totalData_repository.dataUpdate(pmap);
        return result;
    }

    public int dataInsert(Map<String, Object> pmap) {
        logger.info("dataInsert");
        int result = 0;
        result = totalData_repository.dataInsert(pmap);
        return result;
    }
}
