package com.example.vet.repository.board;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class TotalData_Repository {
    Logger logger = LoggerFactory.getLogger(TotalData_Repository.class);
    @Autowired
    SqlSessionTemplate sqlSessionTemplate = null;

    public List<Map<String,Object>>dataList(Map<String, Object>pmap){
        logger.info("dataList");
        List<Map<String, Object>> dList = sqlSessionTemplate.selectList("animalSelect1", pmap);
        logger.info(dList.toString());
        return dList;
    }
    public int dataInsert(Map<String, Object>pmap) {
        logger.info("dataInsert");
        int result = 0;
        result = sqlSessionTemplate.insert("masterInsert", pmap);
        return result;
    }
    public int dataUpdate(Map<String, Object> pmap) {
        logger.info("noticeUpdate");
        int result = 0;
        try {
            //java와 myBatis 연계될때 에러가 발생할 수 있어서 try catch
            result = sqlSessionTemplate.update("masterUpdate", pmap);
        } catch (Exception e) {
            logger.info(e.toString());
        }
        return result;
    }
}

