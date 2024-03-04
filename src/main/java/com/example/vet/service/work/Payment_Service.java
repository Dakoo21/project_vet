package com.example.vet.service.work;

import com.example.vet.model.PaymentVO;
import com.example.vet.repository.work.Payment_Repository;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class Payment_Service {
    Logger logger = LoggerFactory.getLogger(Payment_Service.class);
    @Autowired
    Payment_Repository paymentRepository = null;

    // noticeList 메소드는 지정된 매개변수(pmap)를 기반으로 공지사항 목록을 검색
    public List<Map<String, Object>> paymentList(Map<String, Object> pmap) {
        List<Map<String, Object>> list = new ArrayList<>();
        logger.info("paymentService 리스트입니다");
        list = paymentRepository.paymentList(pmap);
        return list;
    }

    public int paymentInsert(Map<String, Object> pmap) {
        logger.info("paymentService 인서트입니다");
        int result = 0;
        result = paymentRepository.paymentInsert(pmap);
        return result;
    }
}
