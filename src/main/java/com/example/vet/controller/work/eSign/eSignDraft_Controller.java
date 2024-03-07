package com.example.vet.controller.work.eSign;

import com.example.vet.model.*;
import com.example.vet.model.adopt.MissedAnimal;
import com.example.vet.service.work.eSign.eSignDraft_Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

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

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 26.02.25
     기능 : 기안서 작성 페이지 연결
     **********************************************************************************/
    @GetMapping("draftInsertPage")
    public String draftInsertPage(){
        return "esignInsert2";
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 26.02.25
     기능 : 기안서 작성
     **********************************************************************************/
    @PostMapping("adoptDraftInsert")
    public String adoptDraftInsert(SignAdopt signAdopt) {
        log.info("draftAdoptInsert 컨트롤러 호출");
        log.info(signAdopt.toString());
        int result;
        result = eSignDraft_service.insertAdoptDraft(signAdopt);
        return "pages/esignbox/docsBox";
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
    @GetMapping("adopterList")
    @ResponseBody
    public List<MasterVO> adopterList() {
        List<MasterVO> abandonList =  eSignDraft_service.selectAdopter();
        log.info("입양자 리스트");
        log.info(abandonList.toString());
        return eSignDraft_service.selectAdopter();
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
     기능 : pk 조회
     **********************************************************************************/
    // @GetMapping("submitSelectedValue")
    // public ResponseEntity<String> submitSelectedValue(SignAdopt signAdopt) {
    //     // Sign sign = new Sign();
    //     // sign.setSign_title("Your Title");
    //     // sign.setSign_content("Your Content");
    //     // sign.setMember_pk(1);
    //     // sign.setAdopt_pk(6);
    //     Sign insertedSign = eSignDraft_service.createSign(sign);
    //     int generatedSignPk = insertedSign.getSign_pk();
    //     log.info(String.valueOf(generatedSignPk));
    //     // 작업 결과에 따라 응답을 반환 (예: 성공 시 "Success", 실패 시 "Failure")
    //     return ResponseEntity.ok("Sign created with ID: " + generatedSignPk);
    // }
    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 26.02.25
     기능 : pk 조회
     **********************************************************************************/
    // @GetMapping("generatedSignPk")
    // public ResponseEntity<String> submitSelectedValue() {
    //     Sign sign = new Sign();
    //     SignAdopt signAdopt = new SignAdopt();
    //     SignLine signLine = new SignLine();
    //     log.info(sign.toString());
    //     log.info(signAdopt.toString());
    //     log.info(signLine.toString());
    //     signAdopt.setAdopt_nm("토토");
    //     signAdopt.setDesertion_no(1);
    //     signAdopt.setMasterpk(1);
    //     SignAdopt insertedAdoptSign = eSignDraft_service.createAdoptSign(signAdopt);
    //     int generatedAdoptSignPk = insertedAdoptSign.getAdopt_pk();
    //     log.info(String.valueOf(generatedAdoptSignPk));
    //     sign.setAdopt_pk(generatedAdoptSignPk);
    //     // int result = eSignDraft_service.insertSignDoc(sign);
    //     sign.setMember_pk(1);
    //     sign.setAdopt_pk(6);
    //     Sign insertedSign = eSignDraft_service.createSign(sign);
    //     int generatedSignPk = insertedSign.getSign_pk();
    //     signLine.setSign_pk(generatedSignPk);
    //     signLine.setSign_state(0);
    //     signLine.setLv1(1);
    //     signLine.setLv2(0);
    //     signLine.setLv3(0);
    //     signLine.setMember_pk(1);
    //     eSignDraft_service.insertSignLine(signLine);
    //     // log.info(String.valueOf(result));
    //     // 작업 결과에 따라 응답을 반환 (예: 성공 시 "Success", 실패 시 "Failure")
    //     return ResponseEntity.ok("Sign created with ID: " + generatedAdoptSignPk);
    // }


    // 테스트
    @GetMapping("testPage")
    public String testPage(){
        return "pages/customerDB/TotalDataInsert";
    }

    // @PostMapping("generatedSignPk")
    // public ResponseEntity<String> submitSelectedValue(@ModelAttribute SignAdopt signAdopt,
    //                                                   @ModelAttribute Sign sign,
    //                                                   @ModelAttribute SignLine signLine) {
    //     log.info(sign.toString());
    //     log.info(signAdopt.toString());
    //     log.info(signLine.toString());
    //     SignAdopt insertedAdoptSign = eSignDraft_service.createAdoptSign(signAdopt);
    //     int generatedAdoptSignPk = insertedAdoptSign.getAdopt_pk();
    //     log.info(String.valueOf(generatedAdoptSignPk));
    //     sign.setAdopt_pk(generatedAdoptSignPk);
    //     // int result = eSignDraft_service.insertSignDoc(sign);
    //     Sign insertedSign = eSignDraft_service.createSign(sign);
    //     int generatedSignPk = insertedSign.getSign_pk();
    //     signLine.setSign_pk(generatedSignPk);
    //     eSignDraft_service.insertSignLine(signLine);
    //     // log.info(String.valueOf(result));
    //     // 작업 결과에 따라 응답을 반환 (예: 성공 시 "Success", 실패 시 "Failure")
    //     return ResponseEntity.ok("Sign created with ID: " + generatedAdoptSignPk);
    // }

    // @ResponseBody
    // @PostMapping("generatedSignPk")
    // public ResponseEntity<String> submitSelectedValue(@ModelAttribute("adoptForm") SignAdopt signAdopt,
    //                                                    @ModelAttribute("signForm") Sign sign,
    //                                                    @ModelAttribute("signLineForm") SignLine signLine) {
    //     log.info(sign.toString());
    //     log.info(signAdopt.toString());
    //     log.info(signLine.toString());
    //     SignAdopt insertedAdoptSign = eSignDraft_service.createAdoptSign(signAdopt);
    //     int generatedAdoptSignPk = insertedAdoptSign.getAdopt_pk();
    //     log.info(String.valueOf(generatedAdoptSignPk));
    //     sign.setAdopt_pk(generatedAdoptSignPk);
    //     // int result = eSignDraft_service.insertSignDoc(sign);
    //     Sign insertedSign = eSignDraft_service.createSign(sign);
    //     int generatedSignPk = insertedSign.getSign_pk();
    //     signLine.setSign_pk(generatedSignPk);
    //     eSignDraft_service.insertSignLine(signLine);
    //     // log.info(String.valueOf(result));
    //     // 작업 결과에 따라 응답을 반환 (예: 성공 시 "Success", 실패 시 "Failure")
    //     return ResponseEntity.ok("Sign created with ID: " + generatedAdoptSignPk);
    // }

    @PostMapping("generatedSignPk")
    @ResponseBody
    public ResponseEntity<String> submitSelectedValue(@RequestBody  List<Map<String, String>> formDataList){
        SignAdopt signAdopt =  mapJsonToSignAdopt(formDataList);
        log.info(formDataList.toString());
        log.info(signAdopt.toString());
        log.info("generatedSignPk컨트롤러");
        // log.info(sign.toString());
        // log.info(signAdopt.getADOPT_NM());
        // log.info(signAdopt);
        // log.info(signLine.toString());
        int generatedAdoptSign = eSignDraft_service.createAdoptSign(signAdopt);
        // int generatedAdoptSignPk = insertedAdoptSign.getADOPT_PK();
        log.info(String.valueOf(generatedAdoptSign));
        Sign sign = new Sign();
        sign.setSIGN_CONTENT("내용");
        sign.setSIGN_TITLE("제목");
        sign.setSIGN_TYPE("입양신청서");
        sign.setSIGN_RESERV_YEAR("5년");
        sign.setSIGN_DATE("2024-03-01");
        sign.setMEMBER_PK(1);
        sign.setADOPT_PK(generatedAdoptSign);
        // int result = eSignDraft_service.insertSignDoc(sign);
        int generatedSignPk = eSignDraft_service.createSign(sign);
        // int generatedSignPk = insertedSign.getSIGN_PK();
        log.info(String.valueOf(generatedSignPk));
        SignLine signLine = new SignLine();
        signLine.setSIGN_STATE(0);
        signLine.setLV1(1);
        signLine.setLV2(0);
        signLine.setLV3(0);
        signLine.setMEMBER_PK(1);
        signLine.setSIGN_PK(generatedSignPk);
        int result = eSignDraft_service.insertSignLine(signLine);
        log.info(String.valueOf("signline" + result));
        // 작업 결과에 따라 응답을 반환 (예: 성공 시 "Success", 실패 시 "Failure")
        // return ResponseEntity.ok("Sign created with ID: " + generatedAdoptSignPk);
        return ResponseEntity.ok("Success");
    }
    private SignAdopt mapJsonToSignAdopt(List<Map<String, String>> formDataList) {
        SignAdopt.SignAdoptBuilder signAdoptBuilder = SignAdopt.builder();
        for (Map<String, String> formData : formDataList) {
            String name = formData.get("name");
            String value = formData.get("value");
            // "name"에 해당하는 필드를 찾아서 값 설정
            switch (name) {
                case "ADOPT_NM":
                    signAdoptBuilder.ADOPT_NM(value);
                    break;
                case "DESERTION_NO":
                    signAdoptBuilder.DESERTION_NO(Integer.valueOf(value));
                    break;
                case "ADOPT_BDATE":
                    signAdoptBuilder.ADOPT_BDATE(value);
                    break;
                case "ADOPT_SPECIES":
                    signAdoptBuilder.ADOPT_SPECIES(value);
                    break;
                case "ADOPT_BREED":
                    signAdoptBuilder.ADOPT_BREED(value);
                    break;
                case "ADOPT_WEIGHT":
                    signAdoptBuilder.ADOPT_WEIGHT(value);
                    break;
                case "ADOPT_SEX":
                    signAdoptBuilder.ADOPT_SEX(value);
                    break;
                case "ADOPT_NEUT":
                    signAdoptBuilder.ADOPT_NEUT(value);
                    break;
                case "MASTERPK":
                    signAdoptBuilder.MASTERPK(Integer.valueOf(value));
                    break;
                case "ADOPT_REASON":
                    signAdoptBuilder.ADOPT_REASON(value);
                    break;
            }
        }

        SignAdopt signAdopt = new SignAdopt();
        signAdopt = signAdoptBuilder.build();
        return signAdopt;
    }
    //AdoptForm
    @PostMapping("adoptForm")
    public String submitAdoptForm(SignAdopt signAdopt){
        log.info(signAdopt.toString());
        return null;
    }
    //signLineForm
    @RequestMapping("/signLineForm")
    public String submitSignLineForm(SignAdopt signAdopt){
        log.info(signAdopt.toString());
        return null;
    }
    //signForm
    @PostMapping("/signForm")
    public String submitSignForm(SignAdopt signAdopt){
        log.info(signAdopt.toString());
        return null;
    }
}

