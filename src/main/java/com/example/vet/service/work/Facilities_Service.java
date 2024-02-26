package com.example.vet.service.work;

import com.example.vet.model.FacilitiesVO;
import com.example.vet.repository.work.Facilities_Repository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class Facilities_Service {

    Logger logger = LoggerFactory.getLogger(Facilities_Service.class);
    private Facilities_Repository facilitiesRepository;

    public Facilities_Service(Facilities_Repository facilitiesRepository) {
        this.facilitiesRepository = facilitiesRepository;
    }

    //    현 시간 부 모든 사람의 예약 목록 Read 기능
    public List<FacilitiesVO> reserveList(FacilitiesVO facilitiesVO){
        logger.info("예약목록조회시작");
        logger.info("VO: {}", facilitiesVO);
        List<FacilitiesVO> rList = new ArrayList<>();
        rList = facilitiesRepository.reserveList(facilitiesVO);
        logger.info("[조회 결과]:{}", rList.toString());
        return rList;
    }
    //예약 등록
    public int reserveInsert(FacilitiesVO facilitiesVO) {
        logger.info("예약등록파라미터 (facilitiesVO): {}" + facilitiesVO);
        int result = 0;
        result = facilitiesRepository.reserveInsert(facilitiesVO);
        return result;
    }

//    public int reserveDelete(int bcNo) {
//    }

    //예약수정
    //예약삭제

}
