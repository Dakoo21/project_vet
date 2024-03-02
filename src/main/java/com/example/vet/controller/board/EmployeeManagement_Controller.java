package com.example.vet.controller.board;

import com.example.vet.model.Member;
import com.example.vet.service.board.EmployeeManagement_Service;
import lombok.extern.slf4j.Slf4j;
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

    public EmployeeManagement_Controller(EmployeeManagement_Service employeeManagement_service) {
        this.employeeManagement_service = employeeManagement_service;
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 29.02.25
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
     작성일자 : 29.02.25
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
     작성일자 : 29.02.25
     기능 : 사원 정보 업데이트 기능
     **********************************************************************************/

    @PostMapping("/employeeUpdate")
    public String employeeUpdate (Member member) {
        int result;
        //연결은 안됨 - 연결 해야됨
        return null;
    }


    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 29.02.25
     기능 : 사원 정보 삭제
     **********************************************************************************/

    @PostMapping("/employeeDelete")
    public String employeeDelete (String username) {
        int result;
        //연결은 안됨 - 연결 해야됨
        return null;
    }
}
