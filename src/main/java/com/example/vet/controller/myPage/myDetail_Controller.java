package com.example.vet.controller.myPage;

import com.example.vet.config.auth.PrincipalDetails;
import com.example.vet.model.Member;
import com.example.vet.service.myPage.myDetail_Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class myDetail_Controller {
    private final myDetail_Service myDetail_service;


    public myDetail_Controller(myDetail_Service myDetail_service) {
        this.myDetail_service = myDetail_service;
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 26.02.25
     기능 : 내 정보 페이지 연결
     **********************************************************************************/

    @GetMapping("/myDetail")
    public String myDetailPage (Model model) {
        log.info("내 정보 페이지 입장!");
        log.info("내 정보 컨트롤러 시작");

        /*정보 조회를 위해서 세션에서 userPk 가져옴*/
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
        int userPk = principalDetails.getID();
        log.info(String.valueOf(userPk));

        List<Member> myDetail;
        myDetail = myDetail_service.myDetailList(userPk);
        log.info(myDetail.toString());
        model.addAttribute("myDetailList", myDetail);
        return "pages/mypage/employeeInsert";
    }
}
