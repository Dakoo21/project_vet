package com.example.vet.repository.work;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;
@Slf4j
@Repository
public class DIAG_Repository {
    Logger logger = LoggerFactory.getLogger(DIAG_Repository.class);

    private final SqlSessionTemplate sqlSessionTemplate;

    public DIAG_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }


    public List<Map<String, Object>> Select(Map<String, Object> rmap) {
        List<Map<String, Object>> dList= sqlSessionTemplate.selectList("diagSelect", rmap);
        logger.info(dList.toString());
        log.info("레포지토리 셀렉트");
        return dList;
    }

    public List<Map<String, Object>> Insert(Map<String, Object> rmap) {
        sqlSessionTemplate.insert("diagInsert", rmap);
        log.info("서비스 diagInsert 레포지토리입니다");
        sqlSessionTemplate.update("updateBookingTest", rmap);
        List<Map<String, Object>> sList = sqlSessionTemplate.selectList("getDiagNowMade", rmap);
        logger.info("Insert complete");
        return sList;
    }


    public List<Map<String, Object>> SelectCost(Map<String, Object> servicePk) {
        List<Map<String,Object>> List = sqlSessionTemplate.selectList("serviceCost", servicePk);
        return List;
    }

    public void Update(Map<String, Object> rmap) {
        sqlSessionTemplate.update("diagUpdate", rmap);
        sqlSessionTemplate.update("updateBookingPk", rmap);
    }
}
