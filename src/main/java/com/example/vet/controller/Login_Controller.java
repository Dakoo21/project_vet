package com.example.vet.controller;

import com.example.vet.model.Member;
import com.example.vet.service.Login_service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@Slf4j
public class Login_Controller {

    private final Login_service login_service;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired
    public Login_Controller(Login_service login_service, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.login_service = login_service;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @GetMapping("/login")
    public String loginPage(){
        return "pages/login/login";
    }

    @GetMapping("/join")
    public String joinPage(){
        return "pages/login/register";
    }

    @PostMapping("/checkId")
    @ResponseBody
    public int checkId(@RequestParam("id") String id ) throws Exception {
        log.info(id);
        int cnt = login_service.checkId(id);
        return cnt;
    }

    @PostMapping("/findid")
    public String findID(@RequestParam Map<String, Object> fId, Model model) {
        String id = login_service.findID(fId);
        if (id != null) {
            model.addAttribute("id", id);
        }
        return "redirect:pages/login/findID";
    }

    @PostMapping("/joinMember")
    public String joinMember (Member member) {
        log.info("회원가입 Controller 탐");
        member.setMEMBER_ROLE("ROLE_USER");
        int result;
        String path;
        //member 에 있는 원래 비밀번호의 값을 rawPassword 에 할당
        log.info(member.getMEMBER_PW());
        String rawPassword = member.getMEMBER_PW();
        //암호와 처리 로직 추가
        String encPassword = bCryptPasswordEncoder.encode(rawPassword);
        member.setMEMBER_PW(encPassword); // 패스워드 변수 치환 => 원래 비밀번호가 아닌 암복호화 된 비밀번호로 치환
        result = login_service.memberinsert(member);
        if (result != 0) {
            path = "redirect:login";
        } else {
            path = "redirect:login-error";
        }
        log.info("회원가입 Controller 끝");
        return path;
    }
}
