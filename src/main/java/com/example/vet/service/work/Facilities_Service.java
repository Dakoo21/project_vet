package com.example.vet.service.work;


import com.example.vet.model.FacilitiesVO;

import com.example.vet.repository.work.Facilities_Repository;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class Facilities_Service {

    Logger logger = LoggerFactory.getLogger(Facilities_Service.class);
    private Facilities_Repository facilitiesRepository;

    public Facilities_Service(Facilities_Repository facilitiesRepository) {
        this.facilitiesRepository = facilitiesRepository;
    }

    //    현 시간 부 모든 사람의 예약 목록 Read 기능
    public List<Map<String, Object>> reserveList(FacilitiesVO facilitiesVO) {
        logger.info("예약목록조회시작");
        logger.info("VO: {}", facilitiesVO);
        List<Map<String, Object>> rList = new ArrayList<>();
        rList = facilitiesRepository.reserveList(facilitiesVO);
        logger.info("[조회 결과]:{}", rList.toString());
        return rList;
    }

    //예약 등록
    public int Insertreserve(FacilitiesVO facilitiesVO) {
        Map<String, Object> resultMap = facilitiesRepository.SelectReserveId();
        BigDecimal facilityReserveIdBigDecimal = (BigDecimal) resultMap.get("FACILITY_RESERVE_ID");
        int facilityReserveId = facilityReserveIdBigDecimal.intValue(); // BigDecimal을 int로 변환
//        int facilityReserveId = (int) resultMap.get("FACILITY_RESERVE_ID");
        facilitiesVO.setFacilityReserveId(facilityReserveId);


        logger.info("예약등록파라미터 (facilitiesVO): {}" + facilitiesVO);
        int result = 0;
        logger.info("VO: {}", facilitiesVO);
        facilitiesRepository.Insertreserve(facilitiesVO);
        if (result > 0) {
            facilitiesRepository.InsertreserveDetail(facilitiesVO);
        }
        return result;
    }

    //예약수정
    public int reserveUpdate(FacilitiesVO facilitiesVO) {
        int result = 0;
        logger.info("예약수정파라미터 (facilitiesVO): {}" + facilitiesVO);
        result = facilitiesRepository.reserveUpdate(facilitiesVO);
        return result;
    }

    //예약삭제
    public int DeleteReserve(int facilityReserveId) {
        int result = 0;
        logger.info("예약삭제파라미터(facilitiesVO): {}" + facilityReserveId);
        result = facilitiesRepository.DeleteReserve(facilityReserveId);
        if (result > 0) {
            result = facilitiesRepository.DeleteReserveDetail(facilityReserveId);
        }
        return result;
    }

    //    public List<Map<String, Object>> animalList(FacilitiesVO facilitiesVO){
//        logger.info("예약목록조회시작");
//        logger.info("VO: {}", facilitiesVO);
//        List<Map<String, Object>> aList = new ArrayList<>();
//        aList = facilitiesRepository.animaList(facilitiesVO);
//        logger.info("[조회 결과]:{}", aList.toString());
//        return aList;

    public List<Map<String, Object>> animalList(String animalNm) {
        logger.info("animalList");
        List<Map<String, Object>> list = new ArrayList<>();
        ////// @Service, @Autowired
        // noticeDao변수는 NoticeLogic에서 선언만 되었다. new가 없다 - ApplicationContext에서 생성해줌
        // 왜냐면 NoticeLogic앞에 @Service가 붙어 있어서...
        // 이렇게 주입받은 객체의 인스턴스변수로 NoticeDao에 선언된 noticeList메소드를 호출하고 있다.
        // NoticeLogic과 NoticeDao의 연관관계에 대해 고민해 볼것
        list = facilitiesRepository.animalList(animalNm);
        return list;
    }// end of noticeList

    //예약가능확인
    public List<Map<String, Object>> checkImpossible(FacilitiesVO facilitiesVO){
        logger.info("예약목록조회시작");
        logger.info("VO: {}", facilitiesVO);
        List<Map<String, Object>> cList = new ArrayList<>();
        cList = facilitiesRepository.checkImpossible(facilitiesVO);
        logger.info("[조회 결과]:{}", cList.toString());
        return cList;
    }
}
