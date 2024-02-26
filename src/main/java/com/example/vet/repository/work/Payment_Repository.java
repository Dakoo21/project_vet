// package com.example.vet.repository.work;
//
// import com.example.vet.model.PaymentVO;
// import lombok.extern.slf4j.Slf4j;
// import org.mybatis.spring.SqlSessionTemplate;
// import org.springframework.stereotype.Repository;
//
// import java.util.List;
// import java.util.Map;
//
// @Repository
// @Slf4j
// public class Payment_Repository {
//
//     private final SqlSessionTemplate sqlSessionTemplate;
//
//     public Payment_Repository(SqlSessionTemplate sqlSessionTemplate) {
//         this.sqlSessionTemplate = sqlSessionTemplate;
//     }
//
//     public List<Map<String, Object>> Select(PaymentVO paymentVO) {
//         log.info("paymemt Select List Repository 조회 시작");
//         List<Map<String, Object>> paymentList;
//         paymentList = sqlSessionTemplate.selectList("paymentList", paymentVO);
//         log.info("paymemt Select List Repository 조회 끝");
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
