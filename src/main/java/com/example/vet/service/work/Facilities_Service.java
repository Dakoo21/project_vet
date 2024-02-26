package com.example.vet.service.work;

import com.example.vet.controller.work.Facilities_Controller;
import com.example.vet.model.FacilitiesVO;
import com.example.vet.repository.board.QA_Repository;
import com.example.vet.repository.work.Facilities_Repository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class Facilities_Service {

    Logger logger = LoggerFactory.getLogger(Facilities_Service.class);
    private  Facilities_Repository facilitiesRepository;

    public Facilities_Service(Facilities_Repository facilitiesRepository) {
        this.facilitiesRepository = facilitiesRepository;
    }

    //    현 시간 부 모든 사람의 예약 목록 Read 기능
    public List<Map<String, Object>> reserveList(FacilitiesVO facilitiesVO){
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
        int facilityReserveId = (int) resultMap.get("FACILITY_RESERVE_ID");
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
        logger.info("예약삭제파라미터(facilitiesVO): {}" +  facilityReserveId);
        result = facilitiesRepository.DeleteReserve(facilityReserveId);
        if (result > 0) {
            result = facilitiesRepository.DeleteReserveDetail(facilityReserveId);
        }
        return result;
    }
    public List<Map<String, Object>> animalList(FacilitiesVO facilitiesVO){
        logger.info("예약목록조회시작");
        logger.info("VO: {}", facilitiesVO);
        List<Map<String, Object>> aList = new ArrayList<>();
        aList = facilitiesRepository.animaList(facilitiesVO);
        logger.info("[조회 결과]:{}", aList.toString());
        return aList;
    }
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
