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

    public int paymentCash(Map<String, Object> pMap) {
        logger.info("paymentRepository cash입니다");
        int result = 0;
        result = sqlSessionTemplate.insert("paymentCash", pMap);
        return result;
    }

    public Map<String, Object> getPaymentInfo(String diagPk) {
        logger.info("paymentRepository getPaymentInfo입니다");
        return sqlSessionTemplate.selectOne("getPaymentInfo", diagPk);
    }

    public int paymentUpdate(Map<String, Object> pmap) {
        logger.info("paymentUpdate입니다");
        int result2 = 0;
        result2 = sqlSessionTemplate.update("paymentUpdate", pmap);
        return result2;
    }
}
