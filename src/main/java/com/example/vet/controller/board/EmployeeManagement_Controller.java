package com.example.vet.controller.board;

import com.example.vet.model.Member;
import com.example.vet.service.board.EmployeeManagement_Service;
import com.example.vet.service.myPage.myDetail_Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class EmployeeManagement_Controller {

    private final EmployeeManagement_Service employeeManagement_service;
    private final myDetail_Service myDetail_service;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public EmployeeManagement_Controller(EmployeeManagement_Service employeeManagement_service, myDetail_Service myDetailService, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.employeeManagement_service = employeeManagement_service;
        myDetail_service = myDetailService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 29.02.24
     기능 : 사원 관리 페이지 연결 & 전체 사원 조회 & 조건 검색 추가
     **********************************************************************************/

    @GetMapping("/employeeList")
    public String employeeList (Model model, @RequestParam Map<String, Object> employeeMap) {
        List<Map<String, Object>> employList = null;
        log.info(employeeMap.toString());
        employList = employeeManagement_service.employeeList(employeeMap);
        model.addAttribute("employList", employList);
        return "pages/mypage/employeeDetail";
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 29.02.24
     기능 : 사원 디테일 조회
     **********************************************************************************/

    @GetMapping("/employeeDetail")
    public String employeeDetail (Model model, @RequestParam Map<String, Object> employeeMap) {
        List<Map<String, Object>> employeeDetailList = null;
        employeeDetailList = employeeManagement_service.employeeList(employeeMap);
        model.addAttribute("employeeDtailList", employeeDetailList);
        return "pages/mypage/employeeDetailForm";
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 29.02.24
     기능 : 사원 정보 업데이트 기능
     **********************************************************************************/

    @PostMapping("/employeeUpdate")
    public String employeeUpdate (Member member) {

            log.info("사원 정보 업데이트 컨트롤러");
            int result;
            String path;

            log.info(member.toString());
            result = myDetail_service.myDetailUpdate(member);
            if (result == 1) {
                path = "redirect:/employeeList";
            } else {

                path = "error";
            }
            return path;
        }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 02.03.24
     기능 : 사원 정보 비밀번호 업데이트 기능
     **********************************************************************************/

    @PostMapping("/employeePasswordUpdate")
    public String passwordUpdate (Member member) {
        int result;
        String path;
        log.info(member.toString());
        String username = member.getMemberName();
        String rowPassword = member.getMEMBER_PW();
        String encodePassword = bCryptPasswordEncoder.encode(rowPassword);
        member.setMEMBER_PW(encodePassword);
        member.setMEMBER_MEMBERNAME(username);


        result = myDetail_service.passwordUpdate(member);
        if (result == 1) {
            path = "redirect:/employeeList";
        } else {

            path = "error";
        }
        return path;
    }


    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 29.02.25
     기능 : 사원 정보 삭제
     **********************************************************************************/

    @GetMapping("/employeeDelete")
    public String employeeDelete (@RequestParam int MEMBER_PK) {
        log.info(String.valueOf(MEMBER_PK));
        int result;
        String path;

        result = employeeManagement_service.employeeDelete(MEMBER_PK);
        if (result == 1) {
            path = "redirect:/employeeList";
        } else {

            path = "error";
        }
        return path;
    }
}
