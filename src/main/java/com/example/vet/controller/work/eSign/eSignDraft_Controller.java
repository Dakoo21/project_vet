package com.example.vet.controller.work.eSign;

import com.example.vet.config.auth.PrincipalDetails;
import com.example.vet.model.*;
import com.example.vet.model.adopt.MissedAnimal;
import com.example.vet.service.work.eSign.eSignDraft_Service;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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
        return "pages/esignbox/esignInsert";
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
        List<Member> lineList = eSignDraft_service.findLine();
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
        model.addAttribute("draftDetail",draftDetail);
        return "pages/esignbox/esignDetail"; // forward라서 webapp아래에서 찾는다
    }
    
    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 26.02.25
     기능 : 기안서 등록
     **********************************************************************************/
    @PostMapping("generatedSignPk")
    @ResponseBody
    public String submitSelectedValue(@RequestBody Map<String, List<Map<String, String>>> formData){
        List<Map<String, String>> data1 = formData.get("form1Data");
        List<Map<String, String>> data2 = formData.get("form2Data");
        List<Map<String, String>> data3 = formData.get("form3Data");
        Sign sign =  mapJsonToSign(data1);
        SignLine signLine = mapJsonToSignLine(data2);
        SignAdopt signAdopt = mapJsonToSignAdopt(data3);
        int generatedAdoptSign = eSignDraft_service.createAdoptSign(signAdopt);
        sign.setADOPT_PK(generatedAdoptSign);
        int generatedSignPk = eSignDraft_service.createSign(sign);
        signLine.setSIGN_PK(generatedSignPk);
        eSignDraft_service.insertSignLine(signLine);
        eSignDraft_service.insertAdoptAnimal(signAdopt);
        return "docsBox";
    }

    /**********************************************************************************
     작성자 : 최윤정
     작성일자 : 26.02.25
     기능 : 기안서 조회
     **********************************************************************************/
    @GetMapping("eSignDetail")
    public String eSignDetail (Model model,@RequestParam(value="SIGN_PK") int signPk) {
        SignTotal signTotal;
        signTotal = eSignDraft_service.eSignDetail(signPk);
        String masterName = eSignDraft_service.masterName(signTotal.getMASTERPK());
        signTotal.setMASTER_NAME(masterName);
        log.info("detail select완료" + signTotal.toString());
        model.addAttribute("eSignDetail", signTotal);
        return "pages/esignbox/esignDetail";
    }

    @PostMapping("lv2Update")
    public ResponseEntity<String> updateLV2(@RequestParam("signPk") Integer signPk) {
        log.info("lv2 update");
        // signPk를 이용하여 LV_2를 1로 업데이트하는 서비스 메소드 호출
        int result = eSignDraft_service.updateLV2(signPk);
        log.info("lv2 업데이트 " + result);
        return ResponseEntity.ok("Success");
    }

    @PostMapping("lv3Update")
    public ResponseEntity<String> updateLV3(@RequestParam("signPk") Integer signPk) {
        log.info("lv3 update");
        // signPk를 이용하여 LV_2를 1로 업데이트하는 서비스 메소드 호출
        eSignDraft_service.updateLV3(signPk);
        return ResponseEntity.ok("Success");
    }

    @PostMapping("lv2RejectedUpdate")
    public ResponseEntity<String> rejectedLV2(@RequestParam("signPk") Integer signPk) {
        log.info("lv2 rejectUpdate");
        // signPk를 이용하여 LV_2를 1로 업데이트하는 서비스 메소드 호출
        eSignDraft_service.rejectedLV2(signPk);
        return ResponseEntity.ok("Success");
    }

    @PostMapping("lv3RejectedUpdate")
    public ResponseEntity<String> rejectedLV3(@RequestParam("signPk") Integer signPk) {
        log.info("lv3 rejectUpdate");
        // signPk를 이용하여 LV_2를 1로 업데이트하는 서비스 메소드 호출
        eSignDraft_service.rejectedLV3(signPk);
        return ResponseEntity.ok("Success");
    }

    // json -> Sign 변환
    private Sign mapJsonToSign(List<Map<String, String>> formDataList) {
        Sign.SignBuilder signBuilder = Sign.builder();
        for (Map<String, String> formData : formDataList) {
            String name = formData.get("name");
            String value = formData.get("value");
            // "name"에 해당하는 필드를 찾아서 값 설정
            switch (name) {
                case "SIGN_TITLE":
                    signBuilder.SIGN_TITLE(value);
                    break;
                case "SIGN_CONTENT":
                    signBuilder.SIGN_CONTENT(value);
                    break;
                case "SIGN_RESERV_YEAR":
                    signBuilder.SIGN_RESERV_YEAR(value);
                    break;
                case "SIGN_DOCTYPE":
                    signBuilder.SIGN_DOCTYPE(value);
                    break;
                case "MEMBER_PK":
                    signBuilder.MEMBER_PK(Integer.valueOf(value));
                    break;
            }
        }
        Sign sign = new Sign();
        sign = signBuilder.build();
        return sign;
    }

    // json -> SignLine 변환
    private SignLine mapJsonToSignLine(List<Map<String, String>> formDataList) {
        SignLine.SignLineBuilder signLineBuilder = SignLine.builder();
        for (Map<String, String> formData : formDataList) {
            String name = formData.get("name");
            String value = formData.get("value");
            // "name"에 해당하는 필드를 찾아서 값 설정
            switch (name) {
                case "LV1":
                    signLineBuilder.LV1(Integer.valueOf(value));
                    break;
                case "LV2":
                    signLineBuilder.LV2(Integer.valueOf(value));
                    break;
                case "LV3":
                    signLineBuilder.LV3(Integer.valueOf(value));
                    break;
                case "MEMBER_PK":
                    signLineBuilder.MEMBER_PK(Integer.valueOf(value));
                    break;
                case "SIGN_STATE":
                    signLineBuilder.SIGN_STATE(Integer.valueOf(value));
                    break;
            }
        }
        // singline
        SignLine signLine = new SignLine();
        signLine = signLineBuilder.build();
        return signLine;
    }

    // json -> SignAdopt 변환
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


}

