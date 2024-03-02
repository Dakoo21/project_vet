package com.example.vet.controller.myPage;

import com.example.vet.config.auth.PrincipalDetails;
import com.example.vet.model.Member;
import com.example.vet.service.myPage.myDetail_Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class myDetail_Controller {
    private final myDetail_Service myDetail_service;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public myDetail_Controller(myDetail_Service myDetail_service, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.myDetail_service = myDetail_service;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
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

        List<Map<String, Object>> myDetailList = null;
        myDetailList = myDetail_service.myDetailList(userPk);
        log.info(myDetailList.toString());
        model.addAttribute("myDetailList", myDetailList);
        return "pages/mypage/myDetail";
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 28.02.25
     기능 : 비밀번호 확인 후 내 정보 페이지 접속
     **********************************************************************************/

    @PostMapping("/passwordCheckOut")
    public String passwordCheckOut (Member member) throws Exception{
        int result;
        String path;

        log.info(member.toString());
        result = myDetail_service.passwordCheckOut(member);
        log.info(String.valueOf(result));

        if (result == 1) {
            log.info("정상");
            path = "redirect:myDetail";
        } else {
            log.info("에러");
            path = "redirect:myPageIn";
        }
        return path;
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 28.02.25
     기능 : 내 정보 업데이트 기능
     **********************************************************************************/

    @PostMapping("/myDetailUpdate")
    public String myDetailUpdate (Member member) {
        log.info("내 정보 업데이트 컨트롤러");
        int result;
        String path;

        String rowPassword = member.getMEMBER_PW();
        String encodePassword = bCryptPasswordEncoder.encode(rowPassword);
        member.setMEMBER_PW(encodePassword);

        result = myDetail_service.myDetailUpdate(member);
        if (result == 1) {
            path = "redirect:myDetail";
        } else {

            path = "error";
        }
        return path;
    }

}
