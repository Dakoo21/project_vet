package com.example.vet.controller.work.eSign;

import com.example.vet.config.auth.PrincipalDetails;
import com.example.vet.model.Member;
import com.example.vet.model.Sign;
import com.example.vet.service.work.eSign.eSign_Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("eSign/*")
@Slf4j
public class eSign_Controller {


    private final eSign_Service esService;
    public eSign_Controller(eSign_Service esService) {
        this.esService = esService;
    }

    // 문서보관함 : 기안, 결재, 반려, 전체조회
    @GetMapping("docsBox")
    public String docsBoxList(Member member, Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
        String username = principalDetails.getUsername();
        Integer userPK = principalDetails.getID();
        Sign esign = null;
        List<Sign> docList = esService.Select(userPK);
        log.info(userPK.toString());
        log.info("docList : " + String.valueOf(docList.get(0)));
        model.addAttribute("docList", docList);
        return "pages/esignbox/docsBox";
    }

    // 취소보관함
    @GetMapping("cancelledDocs")
    public String cancelledDocsList(Member member, Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
        String username = principalDetails.getUsername();
        Integer userPK = principalDetails.getID();
        log.info(userPK.toString());
        Sign esign = null;
        List<Sign> docList = esService.Select(userPK);
        log.info("docList : " + String.valueOf(docList.get(0)));
        model.addAttribute("docList", docList);
        return "pages/esignbox/cancelledDocs";
    }
    // 진행중인 문서함

    @GetMapping("progressDocs")
    public String progressDocsList(Member member, Model model){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        PrincipalDetails principalDetails = (PrincipalDetails) authentication.getPrincipal();
        Integer userPK = principalDetails.getID();
        Sign esign = null;
        List<Sign> docList = esService.Select(userPK);
        log.info("docList : " + String.valueOf(docList.get(0)));
        model.addAttribute("docList", docList);
        return "pages/esignbox/progressDocs";
    }
}






















