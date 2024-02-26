// package com.example.vet.service.work;
//
// import com.example.vet.common_Interface.Service_Interface;
// import com.example.vet.model.PaymentVO;
// import com.example.vet.repository.work.Payment_Repository;
// import lombok.extern.slf4j.Slf4j;
// import org.springframework.stereotype.Service;
//
// import java.util.List;
// import java.util.Map;
//
// @Service
// @Slf4j
// public class Payment_Service {
//
//     private final Payment_Repository payment_repository;
//
//     public Payment_Service(Payment_Repository payment_repository) {
//         this.payment_repository = payment_repository;
//     }
//
//     public List<Map<String, Object>> Select(PaymentVO paymentVO) {
//         log.info("paymemt Select List Service 조회 시작");
//         List<Map<String, Object>> paymentList;
//         paymentList = payment_repository.Select(paymentVO);
//         log.info("paymemt Select List Service 조회 끝");
//         return paymentList;
//     }
//
//     public int Insert() {
//         return 0;
//     }
//
//     public int Update() {
//         return 0;
//     }
//
//     public int Delete() {
//         return 0;
//     }
// }
