package com.example.vet.controller;

import com.example.vet.model.User;
import com.example.vet.service.SingUP_Service;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class Login_Controller {

    private final SingUP_Service singUPService;
    private final BCryptPasswordEncoder bCryptPasswordEncoder;

    public Login_Controller(SingUP_Service singUPService, BCryptPasswordEncoder bCryptPasswordEncoder) {
        this.singUPService = singUPService;
        this.bCryptPasswordEncoder = bCryptPasswordEncoder;
    }

    @GetMapping("/login")
    public String LoginPage () {
        return "forward:pages/login/login.jsp";
    }

    @PostMapping("/register")
    public String joinMember (User user) {
        user.setCOMMON_CODE_PK(4);
        int result;
        String path;
        //member 에 있는 원래 비밀번호의 값을 rawPassword 에 할당
        String rawPassword = user.getUSER_PW();
        //암호와 처리 로직 추가
        String encPassword = bCryptPasswordEncoder.encode(rawPassword);
        user.setUSER_PW(encPassword); // 패스워드 변수 치환 => 원래 비밀번호가 아닌 암복호화 된 비밀번호로 치환
        result = singUPService.userinsert(user);
        if (result != 0) {
            path = "redirect:login";
        } else {
            path = "redirect:login-error";
        }
        return path;
    }
}
