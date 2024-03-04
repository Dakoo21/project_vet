package com.example.vet.service.board;

import com.example.vet.model.AnimalVO;
import com.example.vet.model.MasterVO;
import com.example.vet.model.TotalDataUpdateVO;
import com.example.vet.repository.board.TotalCustomer_Repository;
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

    public List<Map<String, Object>> detail(AnimalVO animalVO) {
        logger.info("dataList");
        List<Map<String, Object>> dList = new ArrayList<>();
        dList = totalData_repository.detail(animalVO);
        return dList;
    }

    public int dataUpdate(TotalDataUpdateVO totalDataUpdateVO) {
        logger.info("dataUpdate");
        int  result = totalData_repository.dataUpdate(totalDataUpdateVO);
        return result;
    }

    public int dataInsert(AnimalVO animalVO) {
        logger.info("dataInsert");
        int result = 0;
        result = totalData_repository.dataInsert(animalVO);
        return result;
    }

    public List<Map<String,Object>> selectDiag(int animalPk) {
        return totalData_repository.selectDiag(animalPk);
    }
}
