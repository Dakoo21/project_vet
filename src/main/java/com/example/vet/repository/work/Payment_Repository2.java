package com.example.vet.repository.work;

import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.print.attribute.standard.JobKOctets;
import java.util.List;
import java.util.Map;

@Repository
@Slf4j
public class Payment_Repository2 {

    private final SqlSessionTemplate sqlSessionTemplate;

    public Payment_Repository2(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public List<Map<String, Object>> paymentList(Map<String, Object> payment) {
        log.info("진료 기록 전체 레포지토리");
        List<Map<String, Object>> paymentList;
        paymentList = sqlSessionTemplate.selectList("paymentList2", payment);
        return paymentList;
    }

/*    public List<Map<String, Object>> paymentPage(Map<String, Object> pmap) {
        log.info("paymentPage 레포지토리");
        List<Map<String, Object>> list = sqlSessionTemplate.selectList("paymentList", pmap);
        return list;
    }*/
}
