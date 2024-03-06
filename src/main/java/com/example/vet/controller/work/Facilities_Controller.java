package com.example.vet.controller.work;


import com.example.vet.config.auth.PrincipalDetails;
import com.example.vet.model.FacilitiesVO;
import com.example.vet.service.work.Facilities_Service;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Map;

//나중에 페이지 이름 명확하게 dailyReserve-> facilities라고 수정!!
//자 리스트랑 insert 부터 해봅시당
//5개씩 리스트 뽑을거임

@Slf4j
@Controller
@RequestMapping("/reservespot/*")
public class Facilities_Controller {

    private static  Logger logger = LoggerFactory.getLogger(Facilities_Controller.class);
    private Facilities_Service facilitiesService;
    public Facilities_Controller(Facilities_Service facilitiesService){
        this.facilitiesService =facilitiesService;
    }
    //    현 시간 부 모든 사람의 예약 목록 Read 기능
    //WEB INF로 바뀐데요
    //사이드바수정
    @GetMapping("dailyReserve")
    public String reservelist(Model model, FacilitiesVO facilitiesVO){
        logger.info("예약목록조회컨트롤러시작");
        logger.info("예약목록 조회 파라미터(facilitiesVO): {}", facilitiesVO);
        List<Map<String, Object>> rList = facilitiesService.reserveList(facilitiesVO);
        logger.info("[예약목록 조회 결과(rList)]:{}", rList.toString());
        //principalDetails 에서 가져옴
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();

        Integer userPK = principalDetails.getID();
        log.info(userPK.toString());

//        int userPk = (int) session.getAttribute("userPK");
        facilitiesVO.setMemberPk(userPK);
        List<Map<String, Object>> myList = facilitiesService.reserveMyList(facilitiesVO);


        model.addAttribute("rList", rList);

        model.addAttribute("myList", myList);
        return "pages/reservespot/dailyReserve";//경로확인

    }




    //예약 삭제  파라미터 수정

    @GetMapping("reserveDelete")
    public String reserveDelete(int facilityReserveId){
        logger.info("reserveDelete 컨트롤러 시작");
        int result = 0;
        result = facilitiesService.DeleteReserve(facilityReserveId);
//        return "redirect:/pages/reservespot/dailyReserve";
        return "redirect:dailyReserve";
    }

    //동물 조회

    //예약 가능확인
//    @GetMapping("checkImpossible")
//    public String checkImpossible(Model model, FacilitiesVO facilitiesVO){
//        logger.info("예약목록조회컨트롤러시작");
//        logger.info("예약목록 조회 파라미터(facilitiesVO): {}", facilitiesVO);
//        List<Map<String, Object>> cList = facilitiesService.checkImpossible(facilitiesVO);
//        logger.info("[예약목록 조회 결과(cList)]:{}", cList.toString());
//        model.addAttribute("cList", cList);
//        return "forward:/page/reservespot/dailyReserve.jsp";//경로확인 webapp아래서 찾는
//    }
}
