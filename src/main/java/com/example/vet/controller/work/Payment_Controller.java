// package com.example.vet.controller.work;
//
// import com.example.vet.common_Interface.Controller_Interface;
// import com.example.vet.model.PaymentVO;
// import com.example.vet.model.eSign;
// import com.example.vet.service.work.Payment_Service;
// import lombok.extern.slf4j.Slf4j;
// import org.springframework.stereotype.Controller;
// import org.springframework.ui.Model;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.RequestMapping;
//
// import java.util.List;
// import java.util.Map;
//
// @Controller
// @RequestMapping("payment/*")
// @Slf4j
// public class Payment_Controller implements Controller_Interface {
//     private final Payment_Service payment_service;
//     //command+n
//     public Payment_Controller(Payment_Service payment_service) {
//         this.payment_service = payment_service;
//     }
//     @Override
//     @GetMapping("paymentList")
//     public String SelectList(Model model) {
//         PaymentVO paymentVO = new PaymentVO();
//
//         List<Map<String,Object>> pList = payment_service.Select(paymentVO);
//         log.info(pList.toString());
//         model.addAttribute("pList", pList);
//         return "page/payment/paymentList";
//     }
//
//     @Override
//     public String ListDetail() {
//         return "page/payment/paymentDetail";
//     }
// }
