package com.example.vet.controller;

import com.example.vet.config.auth.PrincipalDetails;
import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@Slf4j
public class Main_Controller {

    @GetMapping({"", "/"})
    public String mainPage (HttpServletRequest req, Model model, Authentication authentication, @AuthenticationPrincipal PrincipalDetails userDetails) {
        log.info("main Page 접속 시작");
        String role = "default";
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
        model.addAttribute("role", role);
        if (authentication != null) {
            PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
            String username = principalDetails.getUsername();
            Integer userPK = principalDetails.getID();
            model.addAttribute("username",username);
            model.addAttribute("userPK", userPK);
        }
        return "pages/main/index2";
    }

    @GetMapping("/findID")
    public String foundIdPage () {
        log.info("아이디 찾기 페이지 접속 시도");
        return "pages/login/findID";
    }

    @GetMapping("/findPassword")
    public String foundPasswordPage () {
        return "pages/login/findPassword";
    }
}

