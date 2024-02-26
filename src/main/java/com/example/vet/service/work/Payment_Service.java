package com.example.vet.service.work;

import com.example.vet.model.PaymentVO;
import com.example.vet.repository.work.Payment_Repository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@Slf4j
public class Payment_Service {

    private final Payment_Repository payment_repository;

    @Autowired
    public Payment_Service(Payment_Repository payment_repository) {
        this.payment_repository = payment_repository;
    }

    public void savePayment(PaymentVO paymentVO) {
        log.info("서비스");
        // 결제 정보를 레포지토리를 통해 저장
        payment_repository.savePayment(paymentVO);
    }
}
