package com.example.vet.controller.work.eSign;

import com.example.vet.model.Member;
import com.example.vet.model.SignDocument;
import com.example.vet.service.work.eSign.eSignDraft_Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("eSignDraft/*")
@Slf4j
public class eSignDraft_Controller {

    private final eSignDraft_Service eSignDraft_service;
    public eSignDraft_Controller(eSignDraft_Service eSignDraft_service) {
        this.eSignDraft_service = eSignDraft_service;
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 26.02.25
     기능 : 기안서 작성 페이지 연결
     **********************************************************************************/

    @GetMapping("draftInsertPage")
    public String draftInsertPage(){
        return "pages/esignbox/esignInsert";
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 26.02.25
     기능 : 기안서 작성 기능
     **********************************************************************************/

    @GetMapping("draftInsert")
    public String draftInsert(SignDocument signDocument){
        return "pages/esignbox/docsBox";
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 26.02.25
     기능 : 결재선 선택 기능
     **********************************************************************************/

    @GetMapping("/selectLine") // 요청 URL을 정확하게 지정
    @ResponseBody
    public List<Member> selectLine(Model model) { // 파라미터 명을 JSP 파일에서 보낸 데이터와 일치시킴
        log.info("결재선 조회");
        List<Member> lineList = eSignDraft_service.findLine();
        // model.addAttribute("lineList", lineList);
        log.info(lineList.toString());
        return eSignDraft_service.findLine();
    }
}
