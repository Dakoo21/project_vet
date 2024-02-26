package com.example.vet.repository.work;

import com.example.vet.model.PaymentVO;
import lombok.extern.slf4j.Slf4j;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Slf4j
public class Payment_Repository {

    private final SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    public Payment_Repository(SqlSessionTemplate sqlSessionTemplate) {
        this.sqlSessionTemplate = sqlSessionTemplate;
    }

    public void savePayment(PaymentVO paymentVO) {
        log.info("레포지토리1");
        // 결제 정보를 데이터베이스에 저장하는 쿼리 실행
        String sql = "INSERT INTO payment_table (imp_uid, merchant_uid,pg_tid,name,paid_amount,buyer_name,buyer_tel,amount) VALUES (?,?,?,?,?,?,?,?)";
        log.info("레포지토리2");
        sqlSessionTemplate.insert("insertPayment", paymentVO);
    }
}