package com.example.vet.controller.work;


import com.example.vet.model.FacilitiesVO;
import com.example.vet.service.work.Facilities_Service;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;



@RestController
@RequestMapping("/reservespot/*")
public class RestFacilities_Controller {

    private static Logger logger = LoggerFactory.getLogger(Facilities_Controller.class);
    private Facilities_Service facilitiesService;
    public RestFacilities_Controller(Facilities_Service facilitiesService){
        this.facilitiesService =facilitiesService;
    }


    @GetMapping("/animalList")

    public String animalList(@RequestParam String animalNm) {
        // -> http://localhost:8000/notice/jsonNoticeList?gubun=n_title&keyword=휴관
        logger.info( animalNm);// n_title or n_writer or n_content , keyword=휴관
        List<Map<String, Object>> list = null;
        list = facilitiesService.animalList(animalNm);
        logger.info(list.toString());
        // List, Map - > JSON 변경하기, JSON -> List, Map, JSON -> Array
        Gson g = new Gson();// 오픈소스(해커뉴스, 유튜브, 날씨 API)API - JSON형식 데이터셋 다양하게 관찰
        String temp = g.toJson(list);// 파라미터로 받은 List<Map<>>형태를 JSON형식으로 전환해줌,전환해주는 함수 ==to.json
        return temp;
    }
    //디테일
    @GetMapping("/detailList")

    public String detailList(@RequestParam int facilityReserveId) {
        // -> http://localhost:8000/notice/jsonNoticeList?gubun=n_title&keyword=휴관
        logger.info("수정할려는 id: "+"facilityReserveId");// n_title or n_writer or n_content , keyword=휴관
        Map<String, Object> oneMap = facilitiesService.detailList(facilityReserveId);
        logger.info(oneMap.toString());
        // List, Map - > JSON 변경하기, JSON -> List, Map, JSON -> Array
        Gson g = new Gson();// 오픈소스(해커뉴스, 유튜브, 날씨 API)API - JSON형식 데이터셋 다양하게 관찰
        String temp = g.toJson(oneMap);// 파라미터로 받은 List<Map<>>형태를 JSON형식으로 전환해줌,전환해주는 함수 ==to.json
        return temp;
    }

    //예약 생성
    @PostMapping("insertReserve")
    public String insertReserve(@RequestBody  Map<String, Object> Imap){
        logger.info("예약생성 컨트롤러 시작");



        int result =0;
        String path = "";
        logger.info("Imap컨트롤러: " + Imap);
        result = facilitiesService.insertReserve(Imap);
        logger.info("성공이면 1: " + result);
        if (result == 1) {// 입력이 성공했을때
            path = "suc";// forward안됨
        } else if(result==0){// 입력이 실패 했을때
            path =  "error";
        }else{
            path= "dup";
        }
        return path;
    }
    //예약 수정
    @PostMapping("reserveUpdate")
//    public String reserveUpdate(@RequestBody  Map<String, Object> uMap){
//        logger.info("예약수정시작");
//        int updateResult = 0;
//        updateResult = facilitiesService.reserveUpdate(uMap);
//        return "redirect:/page/reservespot/dailyReserve";

    public String reserveUpdate(@RequestBody  Map<String, Object> uMap ){
        logger.info("예약수정 컨트롤러 시작");



        int result =0;
        String path = "";
        logger.info("수정umap컨트롤러: " + uMap);
        result = facilitiesService.updateReserve(uMap);
        logger.info("성공이면 1: " + result);
        if (result == 1) {// 입력이 성공했을때
            path = "suc";// forward안됨
        } else if(result==0){// 입력이 실패 했을때
            path =  "error";
        }else{// 예약수정 유효성체크 3 dup 다른사람이 예약한 어쩌구 이비다.
            path= "dup";

        }
        return path;
    }

    //모든 리스트 뽑기
    @GetMapping("dailyReserveAll")
        public String reservelistAll(@RequestParam String facilityReserveDt ){
        if (facilityReserveDt == null || facilityReserveDt.trim().isEmpty()) {
            // facilityReserveDt 값이 없는 경우 현재 날짜로 설정
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate currentDate = LocalDate.now();
            facilityReserveDt = formatter.format(currentDate);
        }
        logger.info("모든예약목록조회컨트롤러시작");
        logger.info("모든예약목록 조회 파라미터(facilityDt): {}", facilityReserveDt);
        List<Map<String, Object>> allList = facilitiesService.reserveListAll(facilityReserveDt);
        logger.info("[모든약목록 조회 결과(allList)]:{}", allList.toString());
        // 만약 allList가 비어 있다면 "수술실", "면회실", "방사선실", "미용실" 맵을 포함하는 리스트 생성
//        if (allList.isEmpty()) {
//            logger.info("[모든약목록 조회 결과(allList)]:{}"+"빈배열이래요");
//            Map<String, Object> map1 = new HashMap<>();
//            map1.put("FACILITY_NM", "수술실");
//            map1.put("FACILITY_RESERVE_DT", facilityReserveDt);
//            map1.put("ANIMAL_NM", "예약없음");
//            map1.put("START_TIME", "8:00");
//            map1.put("END_TIME", "8:00");
//
//            allList.add(map1);
//
//            Map<String, Object> map2 = new HashMap<>();
//            map2.put("FACILITY_NM", "면회실");
//            map2.put("FACILITY_RESERVE_DT", facilityReserveDt);
//            map2.put("ANIMAL_NM", "예약없음");
//            map2.put("START_TIME", "8:00");
//            map2.put("END_TIME", "8:00");
//            allList.add(map2);
//
//            Map<String, Object> map3 = new HashMap<>();
//            map3.put("FACILITY_NM", "방사선실");
//            map3.put("FACILITY_RESERVE_DT", facilityReserveDt);
//            map3.put("START_TIME", "8:00");
//            map3.put("END_TIME", "8:00");
//            map3.put("ANIMAL_NM", "예약없음");
//            allList.add(map3);
//
//            Map<String, Object> map4 = new HashMap<>();
//            map4.put("FACILITY_NM", "미용실");
//            map4.put("FACILITY_RESERVE_DT", facilityReserveDt);
//            map4.put("ANIMAL_NM", "예약없음");
//            map4.put("START_TIME", "8:00");
//            map4.put("END_TIME", "8:00");
//            allList.add(map4);
//            logger.info("[조회 결과 비었을 때 추가해준 결과(allList)]: {}", allList);
//        }
        boolean isRadiologyRoomExist = false;
        boolean isBeautyRoomExist = false;
        boolean isSurgeryRoomExist = false;
        boolean isVisitingRoomExist = false;

// 리스트에 각각의 방이 있는지 확인
        for (Map<String, Object> map : allList) {
            String facilityName = (String) map.get("FACILITY_NM");
            if (facilityName.equals("방사선실")) {
                isRadiologyRoomExist = true;
            } else if (facilityName.equals("미용실")) {
                isBeautyRoomExist = true;
            } else if (facilityName.equals("수술실")) {
                isSurgeryRoomExist = true;
            } else if (facilityName.equals("면회실")) {
                isVisitingRoomExist = true;
            }
        }





        // "수술실"이 없으면 맵 추가
        if (!isSurgeryRoomExist) {
            Map<String, Object> surgeryRoom = new HashMap<>();
            surgeryRoom.put("FACILITY_NM", "수술실");
            surgeryRoom.put("FACILITY_RESERVE_DT", facilityReserveDt);
            surgeryRoom.put("ANIMAL_NM", "예약없음");
            surgeryRoom.put("MASTER_NM", "");
            surgeryRoom.put("START_TIME", "10:00");
            surgeryRoom.put("END_TIME", "10:00");
            allList.add(surgeryRoom);
        }

        // "방사선실"이 없으면 맵 추가
        if (!isRadiologyRoomExist) {
            Map<String, Object> radiologyRoom = new HashMap<>();
            radiologyRoom.put("FACILITY_NM", "방사선실");
            radiologyRoom.put("FACILITY_RESERVE_DT", facilityReserveDt);
            radiologyRoom.put("ANIMAL_NM", "예약없음");
            radiologyRoom.put("MASTER_NM", "");
            radiologyRoom.put("START_TIME", "10:00");
            radiologyRoom.put("END_TIME", "10:00");
            allList.add(radiologyRoom);
        }

        // "면회실"이 없으면 맵 추가
        if (!isVisitingRoomExist) {
            Map<String, Object> visitingRoom = new HashMap<>();
            visitingRoom.put("FACILITY_NM", "면회실");
            visitingRoom.put("FACILITY_RESERVE_DT", facilityReserveDt);
            visitingRoom.put("ANIMAL_NM", "예약없음");
            visitingRoom.put("MASTER_NM", "");
            visitingRoom.put("START_TIME", "10:00");
            visitingRoom.put("END_TIME", "10:00");
            allList.add(visitingRoom);
        }

        // "미용실"이 없으면 맵 추가
        if (!isBeautyRoomExist) {
            Map<String, Object> beautyRoom = new HashMap<>();
            beautyRoom.put("FACILITY_NM", "미용실");
            beautyRoom.put("FACILITY_RESERVE_DT", facilityReserveDt);
            beautyRoom.put("ANIMAL_NM", "예약없음");
            beautyRoom.put("MASTER_NM", "");
            beautyRoom.put("START_TIME", "10:00");
            beautyRoom.put("END_TIME", "10:00");
            allList.add(beautyRoom);
        }
        
        Gson g = new Gson();// 오픈소스(해커뉴스, 유튜브, 날씨 API)API - JSON형식 데이터셋 다양하게 관찰
        String temp = g.toJson(allList);// 파라미터로 받은 List<Map<>>형태를 JSON형식으로 전환해줌,전환해주는 함수 ==to.json
        return temp;
    }

}