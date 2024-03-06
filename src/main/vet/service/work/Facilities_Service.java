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
    //    모든 사람의 예약 목록 Read 기능
    public List<Map<String, Object>> reserveListAll(String facilityReserveDt) {
        logger.info("모든예약목록조회시작");
        logger.info("facilityDt: {}", facilityReserveDt);
        List<Map<String, Object>> allList = facilitiesRepository.reserveListAll(facilityReserveDt);
        logger.info("[allList조회 결과]:{}", allList.toString());
        return allList;
    }


    // 현 시간 부 나의 예약 목록 Read 가능
    public List<Map<String, Object>> reserveMyList(FacilitiesVO facilitiesVO) {
        logger.info("예약목록조회시작");
        logger.info("VO: {}", facilitiesVO);
        List<Map<String, Object>> myList = new ArrayList<>();


        myList = facilitiesRepository.reserveMyList(facilitiesVO);
        logger.info("[조회 결과]:{}", myList.toString());
        return myList;
    }

    //예약 등록
    public int insertReserve(Map<String, Object> Imap) {
        List<Map<String, Object>> cList = this.checkImpossible(Imap);

        if (cList != null && cList.size() > 0) {
            return 2;

        }


        Map<String, Object> resultMap = facilitiesRepository.SelectReserveId();
        logger.info("resultMap: " + resultMap);
        BigDecimal facilityReserveIdBigDecimal = (BigDecimal) resultMap.get("FACILITY_RESERVE_ID");
        int facilityReserveId = facilityReserveIdBigDecimal.intValue(); // BigDecimal을 int로 변환
//        int facilityReserveId = (int) resultMap.get("FACILITY_RESERVE_ID");
        logger.info("facilityReserveId:" + facilityReserveId);
        Imap.put("facilityReserveId", facilityReserveId);
        logger.info("imap id 전체:" + Imap);

        int result = 0;

        // @CHS@
        int startTimeInterval = (int) Imap.get("startTimeInterval");    // 시작시간 구간
        int endTimeInterval = (int) Imap.get("endTimeInterval");      // 종료시간 구간

        // @CHS 실질적으로 result가 1이냐 아니냐랑 상관없이 세부내역은 필수로 따라옴(if문 필요 없음)
        result = facilitiesRepository.insertReserve(Imap);

        for (int i = startTimeInterval; i <= endTimeInterval; i++) {
            // @CHS 만약 11:00 ~ 12:30이라면 startTimeInterval=2, endTimeInterval=4
            // @CHS 11:00~11:30(2), 11:30~12:00(3), 12:00~12:30(4) 총 세개 구간
            // @CHS i=startTimeInterval(2) > timeInterval=2 > insert
            // @CHS i++(3) > timeInterval=3 > insert
            // @CHS i++(4) > timeInterval=4 > insert
            // @CHS 와 같이 진행될 예정(나머지 파라미터는 모두 같음)
            Imap.put("timeInterval", i);
            facilitiesRepository.insertReserveDetail(Imap);
        }
        /* @JES@
		if (result > 0) {
            facilitiesRepository.insertReserveDetail(Imap);
        } @JES@ */
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
//디테일 1개에 대한 값
    public Map<String, Object> detailList(int facilityReserveId) {
        logger.info("animalList");
        Map<String, Object> oneMap = facilitiesRepository.detailList(facilityReserveId);
        return oneMap;
    }// end of noticeList

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
    public List<Map<String, Object>> checkImpossible(Map<String, Object> cMap) {
        logger.info("예약목록조회시작");
        logger.info("VO: {}", cMap);
        List<Map<String, Object>> cList = new ArrayList<>();
        cList = facilitiesRepository.checkImpossible(cMap);
        logger.info("[조회 결과]:{}", cList.toString());
        return cList;
    }
    //예약수정 유효성 체크

    //예약수정

    public int updateReserve(Map<String, Object> uMap) {
        //1. 예약수정 유효성체크 3 dup 다른사람이 예약한 어쩌구 이비다.
        int possible = facilitiesRepository.checkImpossibleUpdate(uMap);
        logger.info("예약업데이트id 유효성 체크 ,서비스,1이면 다른 사람 예약건 때문에 안됨" + possible);
        if (possible == 1) {
            return 3;
        }
        //2. 예약 메인 테이블 업데이트 ==0

        int result = facilitiesRepository.updateReserve(uMap);
        if (result != 1) {
            return 0;
        }


        //3. 디테일 테이블은 해당아이디로 삭제후
        String facilityReserveIdStr = (String) uMap.get("facilityReserveId");
        int facilityReserveId = Integer.parseInt(facilityReserveIdStr);
//        int facilityReserveId = facilitiesRepository.checkImpossibleUpdate(uMap);
        logger.info("삭제 resultMap id: " + facilityReserveId);

        int deletResult = facilitiesRepository.DeleteReserveDetail(facilityReserveId);
        //삭제 성공 시
        if (deletResult > 0) {
            //디테일 테이블 insert
            logger.info("facilityReserveId:" + facilityReserveId);
            uMap.put("facilityReserveId", facilityReserveId);
            logger.info("uMap id 관한 전체:" + uMap);


            // @CHS@
            int startTimeInterval = (int) uMap.get("startTimeInterval");    // 시작시간 구간
            int endTimeInterval = (int) uMap.get("endTimeInterval");      // 종료시간 구간

//            // @CHS 실질적으로 result가 1이냐 아니냐랑 상관없이 세부내역은 필수로 따라옴(if문 필요 없음)
//            result = facilitiesRepository.insertReserveDetail(uMap);

            for (int i = startTimeInterval; i <= endTimeInterval; i++) {
                // @CHS 만약 11:00 ~ 12:30이라면 startTimeInterval=2, endTimeInterval=4
                // @CHS 11:00~11:30(2), 11:30~12:00(3), 12:00~12:30(4) 총 세개 구간
                // @CHS i=startTimeInterval(2) > timeInterval=2 > insert
                // @CHS i++(3) > timeInterval=3 > insert
                // @CHS i++(4) > timeInterval=4 > insert
                // @CHS 와 같이 진행될 예정(나머지 파라미터는 모두 같음)
                uMap.put("timeInterval", i);
                result =facilitiesRepository.insertReserveDetail(uMap);
            }
        /* @JES@
		if (result > 0) {
            facilitiesRepository.insertReserveDetail(Imap);
        } @JES@ */
        }
        return result;
    }


}