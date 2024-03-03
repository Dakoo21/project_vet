package com.example.vet.controller.work.eSign;

import com.example.vet.model.MasterVO;
import com.example.vet.model.Member;
import com.example.vet.model.Sign;
import com.example.vet.model.adopt.MissedAnimal;
import com.example.vet.service.work.eSign.eSignDraft_Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("eSignDraft/*")
@Slf4j
public class eSignDraft_Controller {
    @Autowired
    private SignMapper signMapper;

    private final eSignDraft_Service eSignDraft_service;
    public eSignDraft_Controller(eSignDraft_Service eSignDraft_service) {
        this.eSignDraft_service = eSignDraft_service;
    }


    @PostMapping("/create")
    public String createSign(@RequestBody Sign sign) {
        eSignDraft_service.createSign(sign);
        int generatedSignPk = sign.getSign_pk(); // 생성된 키 받아오기
        return "Sign created with ID: " + generatedSignPk;
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
     기능 : 결재선 선택 기능
     **********************************************************************************/

    @ResponseBody
    @GetMapping("selectLine") // 요청 URL을 정확하게 지정
    public List<Member> selectLine(Model model) { // 파라미터 명을 JSP 파일에서 보낸 데이터와 일치시킴
        log.info("결재선 조회");
        List<Member> lineList = eSignDraft_service.findLine();
        // model.addAttribute("lineList", lineList);
        log.info(lineList.toString());
        return lineList;
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 26.02.25
     기능 : 입양자 선택 기능
     **********************************************************************************/
    @ResponseBody
    @GetMapping("adopterList")
    public List<MasterVO> adopterList() {
        List<MasterVO> abandonList =  eSignDraft_service.selectAdopter();
        log.info("입양자 리스트");
        log.info(abandonList.toString());
        return abandonList;
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 26.02.25
     기능 : 유기동물 선택 기능
     **********************************************************************************/

    @GetMapping("abandonList")
    @ResponseBody
    public List<MissedAnimal> abandonList() {
        // MissedAnimal missedAnimal = null;
        List<MissedAnimal> abandonList = eSignDraft_service.selectAbandon();
        // model.addAttribute("abandonList", abandonList);
        log.info("유기동물 리스트");
        log.info(abandonList.toString());
        return eSignDraft_service.selectAbandon();
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 26.02.25
     기능 : 기안서 작성
     **********************************************************************************/
    // @PostMapping("eDraftInsert")
    // public String eSignInsert(Sign sign) {
    //     int result;
    //     result = eSignDraft_service.insertDraft(sign);
    //     return "pages/esignbox/docsBox";
    // }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 26.02.25
     기능 : 기안서 조회
     **********************************************************************************/
    @GetMapping("draftDetail")
    public String draftDetail(@RequestParam("draftPk") int draft_pk, Model model) {
        log.info("기안서 상세페이지 조회");
        List<Sign> draftDetail = eSignDraft_service.selectDetail(draft_pk);
        // model.addAttribute("lineList", lineList);

        model.addAttribute("draftDetail",draftDetail);

        return "pages/esignbox/esignDetail"; // forward라서 webapp아래에서 찾는다
    }
    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 26.02.25
     기능 : 기안서 조회
     **********************************************************************************/
    //@RequestBody Sign sign
//     @PostMapping("/eSignDraft/submitSelectedValue")
//     public String submitSelectedValue( ) {
//
//         Sign sign = new Sign();
//         sign.setSign_title("Your Title");
//         sign.setSign_content("Your Content");
//
//         signMapper.insertSign(sign);
//
// // 이제 sign 객체의 signPk에는 자동 생성된 키 값이 들어있습니다.
//         int generatedKey = sign.getSign_pk();
//         // 작업 결과에 따라 응답을 반환 (예: 성공 시 "Success", 실패 시 "Failure")
//         return "Success";
//     }
    @GetMapping("submitSelectedValue")
    public ResponseEntity<String> submitSelectedValue() {
        Sign sign = new Sign();
        sign.setSign_title("Your Title");
        sign.setSign_content("Your Content");
        sign.setMember_pk(1);
        sign.setAdopt_pk(6);
        // // 받은 signDocumentVO를 이용한 원하는 작업 수행
        // try {
        //     eSignDraft_service.createSign(sign);
        //     log.info(String.valueOf(sign.getSign_pk()));
        //     return ResponseEntity.ok("Sign created successfully");
        // } catch (Exception e) {
        //     return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error creating sign");
        // }
        Sign insertedSign = eSignDraft_service.createSign(sign);
        int generatedSignPk = insertedSign.getSign_pk();
        log.info(String.valueOf(generatedSignPk));

        // 작업 결과에 따라 응답을 반환 (예: 성공 시 "Success", 실패 시 "Failure")
        return ResponseEntity.ok("Sign created with ID: " + generatedSignPk);
    }
}

