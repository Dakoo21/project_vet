package com.example.vet.controller;

import com.example.vet.config.auth.PrincipalDetails;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Map;

@Controller
@Slf4j
public class Main_Controller {

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 21.02.25
     기능 : 로그인 후 메인페이지(마이페이지) 연결
     **********************************************************************************/

    @GetMapping({"", "/"})
    public String mainPage (HttpServletRequest req, Model model, Authentication authentication) {
        log.info("main Page 접속 시작");
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
            path = "pages/mypage/customer";
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
     작성일자 : 26.02.25
     기능 : 아이디 찾기 페이지
     **********************************************************************************/

    @GetMapping("/findID")
    public String foundIdPage () {
        log.info("아이디 찾기 페이지 접속 시도");
        return "pages/login/findID";
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 26.02.25
     기능 : 비밀번호 찾기 페이지
     **********************************************************************************/

    @GetMapping("/findPassword")
    public String foundPasswordPage () {
        return "pages/login/findPassword";
    }
}

