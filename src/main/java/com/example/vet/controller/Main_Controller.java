package com.example.vet.controller;

import com.example.vet.config.auth.PrincipalDetails;
import com.example.vet.model.BookingVO;
import com.example.vet.model.Notice;
import com.example.vet.service.board.EmployeeManagement_Service;
import com.example.vet.service.board.Notice_Board_Service;
import com.example.vet.service.work.Booking_Service;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class Main_Controller {

    private final Booking_Service bookingService;
    private final Notice_Board_Service notice_board_service;
    private final EmployeeManagement_Service employeeManagement_service;

    @Autowired
    public Main_Controller(Booking_Service bookingService, Notice_Board_Service noticeBoardService, EmployeeManagement_Service employeeManagementService) {
        this.bookingService = bookingService;
        notice_board_service = noticeBoardService;
        employeeManagement_service = employeeManagementService;
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 21.02.24
     기능 : 로그인 후 메인페이지(마이페이지) 연결
     **********************************************************************************/

    @GetMapping({"", "/"})
    public String mainPage (HttpServletRequest req, Model model, Authentication authentication, Notice notice, Map<String, Object> employeeMap) {
        log.info("main Page 접속 시작");


        /**********************************************************************************
         작성자 : 지장환
         작성일자 : 06.03.24
         기능 : 진료 예약 호출(캘린더)
         **********************************************************************************/
        BookingVO bookingVO = null;
        List<Map<String,Object>> bList = bookingService.Select(bookingVO);
        log.info(bList.toString());
        model.addAttribute("bList", bList);

        /**********************************************************************************
         작성자 : 지장환
         작성일자 : 06.03.24
         기능 : 공지사항 호출
         **********************************************************************************/
        log.info(notice.toString());
        List<Notice> noticeList;
        noticeList = notice_board_service.noticeList(notice);
        log.info(noticeList.toString());
        model.addAttribute("noticeList", noticeList);

        /**********************************************************************************
         작성자 : 지장환
         작성일자 : 06.03.24
         기능 : 사원관리 호출
         **********************************************************************************/
        List<Map<String, Object>> employList = null;
        log.info(employeeMap.toString());
        employList = employeeManagement_service.employeeList(employeeMap);
        model.addAttribute("employList", employList);




        String role = "default";
        String path = "";
        if (req.isUserInRole("ROLE_ADMIN")) {
            role = "ROLE_ADMIN";
        } else if (req.isUserInRole("ROLE_MASTER")) {
            role = "ROLE_MASTER";
        } else if (req.isUserInRole("ROLE_NURSE")) {
            role = "ROLE_NURSE";
        } else if (req.isUserInRole("ROLE_INFO")) {
            role = "ROLE_INFO";
        } else if (req.isUserInRole("ROLE_USER")) {
            role = "ROLE_USER";
        }

        if (role.equals("ROLE_ADMIN")) {
            path = "pages/mypage/admin";
        } else if (role.equals("ROLE_MASTER")) {
            path = "pages/mypage/admin";
        } else if (role.equals("ROLE_NURSE")) {
            path = "pages/mypage/nurse";
        } else if (role.equals("ROLE_INFO")) {
            path = "pages/mypage/nurse";
        } else if (role.equals("ROLE_USER")) {
            path = "pages/guide/introMap";
        }
        model.addAttribute("role", role);
         if (authentication != null) {
             PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
             String username = principalDetails.getUsername();
             Integer userPK = principalDetails.getID();
             model.addAttribute("username",username);
             model.addAttribute("userPK", userPK);
         }
        return path;
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 26.02.24
     기능 : 아이디 찾기 페이지
     **********************************************************************************/

    @GetMapping("/findID")
    public String foundIdPage () {
        log.info("아이디 찾기 페이지 접속 시도");
        return "pages/login/findID";
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 26.02.24
     기능 : 비밀번호 찾기 페이지
     **********************************************************************************/

    @GetMapping("/findPassword")
    public String foundPasswordPage () {
        return "pages/login/findPassword";
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 28.02.24
     기능 : 내 정보 접속 인증 페이지 접속
     **********************************************************************************/

    @GetMapping("/myPageIn")
    public String myPageIn () {
        return "pages/main/myDetailAuthorization";
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 03.03.24
     기능 : 병원 위치 페이지 접속
     **********************************************************************************/

    @GetMapping("/introMap")
    public String introMap () {
        return "pages/guide/introMap";
    }
}

