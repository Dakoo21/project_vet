package com.example.vet.controller.work;

import com.example.vet.common_Interface.Controller_Interface;
import com.example.vet.model.PaymentVO;
import com.example.vet.service.work.Payment_Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("payment/*")
@Slf4j
public class Payment_Controller {
    private final Payment_Service payment_service;
    //command+n
    @Autowired
    public Payment_Controller(Payment_Service payment_service) {
        log.info("컨트롤러1");
        this.payment_service = payment_service;
    }

    @PostMapping("process-payment")
    public String processPayment(Model model,
                                 @RequestParam("imp_uid") String impUid,
                                 @RequestParam("merchant_uid") String merchantUid,
                                 @RequestParam("pg_tid") String pg_tid,
                                 @RequestParam("name") String name,
                                 @RequestParam("amount") Integer amount,
                                 @RequestParam("paid_amount") Integer paid_amount,
                                 @RequestParam("buyer_name") String buyer_name,
                                 @RequestParam("buyer_tel") String buyer_tel) {
        log.info("컨트롤러2");
        PaymentVO paymentVO = new PaymentVO();
        log.info("컨트롤러3");
        paymentVO.setImpUid(impUid);
        paymentVO.setMerchantUid(merchantUid);
        paymentVO.setPg_tid(pg_tid);
        paymentVO.setName(name);
        paymentVO.setAmount(amount);
        paymentVO.setPaid_amount(paid_amount);
        paymentVO.setBuyer_name(buyer_name);
        paymentVO.setBuyer_tel(buyer_tel);
        log.info("컨트롤러4");

        // 결제 정보 저장
        payment_service.savePayment(paymentVO);

        // 결제 성공 시 뷰를 반환하고 결제 정보를 모델에 추가
        model.addAttribute("paymentVO", paymentVO);

        // 결제 성공 시 뷰를 반환(jsp 페이지 따로 있음)
        return "page/payment/paymentSuccess";
    }
}