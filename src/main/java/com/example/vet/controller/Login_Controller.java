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

import java.util.HashMap;
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

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 21.02.24
     기능 : 로그인 페이지 연결
     **********************************************************************************/

    @GetMapping("/login")
    public String loginPage(){
        return "pages/login/login";
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 21.02.24
     기능 : 회원가입 페이지 연결
     **********************************************************************************/

    @GetMapping("/join")
    public String joinPage(){
        return "pages/login/register";
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 21.02.24
     기능 : 아이디 유효성 검사
     **********************************************************************************/

    @PostMapping("/checkId")
    @ResponseBody
    public int checkId(@RequestParam("id") String id ) throws Exception {
        log.info(id);
        int cnt = login_service.checkId(id);
        return cnt;
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 21.02.24
     기능 : 회원가입 기능
     **********************************************************************************/

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

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 26.02.24
     기능 : 아이디 찾기 기능
     **********************************************************************************/

    @PostMapping("/findid") // 요청 URL을 정확하게 지정
    @ResponseBody
    public Map<String, Object> findID(@RequestParam("name") String memberName, @RequestParam("email") String memberEmail) { // 파라미터 명을 JSP 파일에서 보낸 데이터와 일치시킴
        log.info("아이디 찾기 로직 시작");
        Member member = new Member();
        member.setMEMBER_MEMBERNAME(memberName);
        member.setMEMBER_EMAIL(memberEmail);
        log.info(member.toString());

        String userID = login_service.findID(member);

        // JSON 형식으로 데이터 반환
        Map<String, Object> response = new HashMap<>();
        if (userID != null) {
            response.put("userID", userID);
        } else {
            response.put("userID", null);
        }
        log.info(response.toString());
        return response;
    }

    /**********************************************************************************
     작성자 : 지장환
     작성일자 : 26.02.24
     기능 : 비밀번호 찾기 기능
     **********************************************************************************/

    @PostMapping("/findpasword") // 요청 URL을 정확하게 지정
    @ResponseBody
    public Map<String, Object> findPassword(@RequestParam("ID") String memberID, @RequestParam("email") String memberEmail) { // 파라미터 명을 JSP 파일에서 보낸 데이터와 일치시킴
        log.info("비밀번호 찾기 로직 시작");
        Member member = new Member();
        member.setMEMBER_ID(memberID);
        member.setMEMBER_EMAIL(memberEmail);
        log.info(member.toString());
        String userRowPassword = login_service.findPassword(member);
        String userPassword = userRowPassword.substring(10,30);
        String encPassword = bCryptPasswordEncoder.encode(userPassword);
        member.setMEMBER_PW(encPassword);
        login_service.userPasswordUpdate(member);
        log.info(userPassword);

        // JSON 형식으로 데이터 반환
        Map<String, Object> response = new HashMap<>();
        if (userPassword != null) {
            response.put("userPass", userPassword);
        } else {
            response.put("userPass", null);
        }
        log.info(response.toString());
        return response;
    }
}
