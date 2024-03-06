package com.example.vet.controller.work;

import com.example.vet.service.work.Payment_Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("payment/*")
public class Payment_Controller {
    Logger logger = LoggerFactory.getLogger(Payment_Controller.class);
    @Autowired
    Payment_Service paymentService = null;
    @GetMapping("paymentList")
    public String paymentList(Model model, @RequestParam Map<String, Object> pmap) {
        List<Map<String, Object>> pList = null;
        logger.info("paymentList입니다");
        pList = paymentService.paymentList(pmap);
        model.addAttribute("pList", pList);
        return "pages/payment/paymentList";
    }

    @GetMapping("paymentDetail")
    public String paymentDetail(Model model, @RequestParam Map<String, Object> pmap) {
        logger.info("paymentDetail");
        List<Map<String, Object>> pList = null;
        pList = paymentService.paymentList(pmap);
        model.addAttribute("pList", pList);
        return "paymentList";
    }

    @PostMapping("/paymentInsert")
    public String paymentInsert(@RequestParam Map<String, Object> pmap) {
        logger.info("paymentInsert입니다");

        // 결제 서비스를 통해 데이터를 삽입하고 결과를 받음
        int result = paymentService.paymentInsert(pmap);

        // 결과에 따라 다음 경로 결정
        if (result == 1) {
            // 삽입 성공 시 paymentList로 리다이렉트
            return "redirect:/paymentList";
        } else {
            // 삽입 실패 시 에러 페이지로 리다이렉트
            return "redirect:/paymentError.jsp";
        }
    }

    @PostMapping("/paymentCash")
    public String paymentCash(@RequestParam Map<String, Object> pmap) {
        logger.info("paymentCash입니다");

        // 결제 서비스를 통해 데이터를 삽입하고 결과를 받음
        int result = paymentService.paymentCash(pmap);

        // 결과에 따라 다음 경로 결정
        if (result == 1) {
            // 삽입 성공 시 paymentList로 리다이렉트
            return "redirect:/payment/paymentList";
        } else {
            // 삽입 실패 시 에러 페이지로 리다이렉트
            return "redirect:/paymentError.jsp";
        }
    }

}