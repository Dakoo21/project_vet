package com.example.vet.service.work;

import com.example.vet.repository.work.Payment_Repository2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class Payment_Service2 {

    private final Payment_Repository2 payment_repository2;

    public Payment_Service2(Payment_Repository2 payment_repository2) {
        this.payment_repository2 = payment_repository2;
    }

    public List<Map<String, Object>> paymentList(Map<String, Object> payment) {
        log.info("진료 기록 전체 서비스");
        List<Map<String, Object>> paymentList;
        paymentList = payment_repository2.paymentList(payment);
        return paymentList;
    }

/*    public List<Map<String, Object>> paymentPage(Map<String, Object> pmap) {
        List<Map<String, Object>> list = new ArrayList<>();
        log.info("paymentPage 서비스");
        list = payment_repository2.paymentPage(pmap);
        return list;
    }*/
}
