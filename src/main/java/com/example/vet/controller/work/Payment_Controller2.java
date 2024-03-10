package com.example.vet.controller.work;

import com.example.vet.service.work.Payment_Service2;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@Slf4j
@RequestMapping("payment2/*")
public class Payment_Controller2 {

    private final Payment_Service2 payment_service2;

    public Payment_Controller2(Payment_Service2 payment_service2) {
        this.payment_service2 = payment_service2;
    }

    @GetMapping("paymentList2")
    public String paymentList (Model model, @RequestParam Map<String, Object> payment) {
        log.info("진료 기록 전체 조회");
        List<Map<String, Object>> paymentList;
        paymentList = payment_service2.paymentList(payment);
        log.info(paymentList.toString());
        model.addAttribute("paymentList", paymentList);
        return "pages/payment/paymentList2";
    }
}
