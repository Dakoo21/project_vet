package com.example.vet.controller.work;


import com.example.vet.model.FacilitiesVO;
import com.example.vet.service.work.Facilities_Service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

//나중에 페이지 이름 명확하게 dailyReserve-> facilities라고 수정!!
//자 리스트랑 insert 부터 해봅시당
//5개씩 리스트 뽑을거임

@Controller
@RequestMapping("/pages/reservespot/*")
public class Facilities_Controller {

    private static Logger logger = LoggerFactory.getLogger(Facilities_Controller.class);
    private Facilities_Service facilitiesService;
    public Facilities_Controller(Facilities_Service facilitiesService){
        this.facilitiesService =facilitiesService;
    }
//    현 시간 부 모든 사람의 예약 목록 Read 기능
    //이거 뭔가 링크 잘못된듯. 매핑을 바꿔주던 파일이름 을 바꿔주던 해야함


    @GetMapping("dailyReserve")
    public String reserveList(Model model, FacilitiesVO facilitiesVO) throws Exception {

        logger.info("예약목록조회컨트롤러시작");
        logger.info("예약목록 조회 파라미터(facilitiesVO): {}", facilitiesVO);
        List<FacilitiesVO> rList = facilitiesService.reserveList(facilitiesVO);
        logger.info("[예약목록 조회 결과(rList)]:{}", rList.toString());
        model.addAttribute("rList", rList);
        return "forward:/pages/reservespot/dailyReserve.jsp";//경로확인 webapp아래서 찾는
    }
    //예약 생성
    @GetMapping("reserveInsert")
    public String reserveInsert(FacilitiesVO facilitiesVO){
        logger.info("예약생성 컨트롤러 시작");
        int result =0;
        result = facilitiesService.reserveInsert(facilitiesVO);
        return "redirect:/pages/reservespot/dailyReserve";
    }


    //예약 수정

    //예약 삭제  파라미터 수정
//    @GetMapping("reserveDelete")
//    public String reserveDelete(@RequestParam int bc_no,int b_no){
//        logger.info("reserveDelete");
//        int result = 0;
//        result = facilitiesService.reserveDelete(bc_no);
//        return "redirect:/pages/reservespot/dailyReserve";
//    }

}
