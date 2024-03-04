package com.example.vet.repository.work;

import com.example.vet.model.PaymentVO;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class Payment_Repository {
    Logger logger = LoggerFactory.getLogger(Payment_Repository.class);
    @Autowired
    SqlSessionTemplate sqlSessionTemplate = null;

    public List<Map<String, Object>> paymentList(Map<String, Object> pmap) {
        logger.info("paymentRepository 리스트입니다");
        List<Map<String, Object>> list = sqlSessionTemplate.selectList("paymentList", pmap);
        return list;
    }

    public int paymentInsert(Map<String, Object> pMap) {
        logger.info("paymentRepository 인서트입니다");
        int result = 0;
        result = sqlSessionTemplate.insert("paymentInsert", pMap);
        return result;
    }
}
