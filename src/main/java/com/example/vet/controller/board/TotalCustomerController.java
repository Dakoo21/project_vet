package com.example.vet.controller.board;

import com.example.vet.model.MasterVO;
import com.example.vet.service.board.TotalCustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("CustomerDB/*")
public class TotalCustomerController {

    private static final Logger logger = LoggerFactory.getLogger(TotalCustomerController.class);

    private final TotalCustomerService totalCustomerService;


    public TotalCustomerController(TotalCustomerService totalCustomerService) {
        this.totalCustomerService = totalCustomerService;
    }

    @GetMapping("TotalCustomerList")
    public String list(Model model) {
        MasterVO masterVO = null;
        List<Map<String, Object>> cList = totalCustomerService.Select(masterVO);
        logger.info(cList.toString());
        model.addAttribute("cList", cList);
        return "pages/customerDB/TotalCustomerList";
    }

    @GetMapping("TotalCustomerDetail")
    public String listDetail(@RequestParam int masterPk, Model model){
        MasterVO masterVO = new MasterVO();
        masterVO.setMasterPk(masterPk);
        logger.info(masterVO.toString());
//        List<Map<String,Object>>cList = totalCustomerService.Detail(masterVO);
        masterVO = totalCustomerService.Detail(masterVO);
        model.addAttribute("cList", masterVO);
        return "pages/customerDB/TotalCustomerDetail";
    }

    /**
     *  저장하는 화면 가져오는 메소드
     * @return
     */
    @GetMapping("TotalCustomerInsertPage")
    public String insertPage(){
        return "pages/customerDB/TotalCustomerInsert";
    }

    @RequestMapping(value = "TotalCustomerInsert", method = {RequestMethod.GET, RequestMethod.POST})
//    @PostMapping("TotalCustomerInsert")
    public String insert(@RequestParam Map<String, Object> rmap) {
        MasterVO masterVO = new MasterVO();
        //masterVO.master1= new master1();
        logger.info(rmap.get("MASTERPK").toString());
        Integer masterPk = Integer.parseInt(rmap.get("MASTERPK").toString());
        masterVO.setMasterPk(masterPk);

        //이름
        String masterNm = (String) rmap.get("MASTER_NM");
        masterVO.setMaster_nm(masterNm);

        //아이디
        String masterUsername = (String) rmap.get("MASTER_USERNAME");
        masterVO.setMaster_username(masterUsername);

        //비밀번호
        String masterPw = (String) rmap.get("MASTER_PW");
        masterVO.setMaster_pw(masterPw);

        //이메일
        String masterEmail = (String) rmap.get("MASTER_EMAIL");
        masterVO.setMaster_email(masterEmail);

        //폰번호
        String masterPnumber = (String) rmap.get("MASTER_PNUMBER");
        masterVO.setMaster_pnumber(masterPnumber);

        //주소
        String masterAddress = (String) rmap.get("MASTER_ADDRESS");
        masterVO.setMaster_address(masterAddress);

        //생년월일
        String masterBdate = (String) rmap.get("MASTER_BDATE");
        masterVO.setMaster_bdate(masterBdate);

        //성별
        String masterGender = (String) rmap.get("MASTER_GENDER");
        masterVO.setMaster_gender(masterGender);

        logger.info(masterVO.toString());
        int inserted = totalCustomerService.Insert(masterVO);

        if (inserted == 1) {
            return "pages/customerDB/TotalCustomerInsert";
        } else {
            return "error";
        }
    }

    @PostMapping("TotalCustomerDataUpdate")
    public String update(@RequestParam Map<String, Object> rmap) {
        MasterVO masterVO = new MasterVO();
        Integer masterPk = Integer.parseInt(rmap.get("MASTERPK").toString());
        masterVO.setMasterPk(masterPk);

        //이름
        String masterNm = (String) rmap.get("MASTER_NM");
        masterVO.setMaster_nm(masterNm);

        //아이디
        String masterUsername = (String) rmap.get("MASTER_USERNAME");
        masterVO.setMaster_username(masterUsername);

        //비밀번호
        String masterPw = (String) rmap.get("MASTER_PW");
        masterVO.setMaster_pw(masterPw);

        //이메일
        String masterEmail = (String) rmap.get("MASTER_EMAIL");
        masterVO.setMaster_email(masterEmail);

        //폰번호
        String masterPnumber = (String) rmap.get("MASTER_PNUMBER");
        masterVO.setMaster_pnumber(masterPnumber);

        //주소
        String masterAddress = (String) rmap.get("MASTER_ADDRESS");
        masterVO.setMaster_address(masterAddress);

        //생년월일
        String masterBdate = (String) rmap.get("MASTER_BDATE");
        masterVO.setMaster_bdate(masterBdate);

        //성별
        String masterGender = (String) rmap.get("MASTER_GENDER");
        masterVO.setMaster_gender(masterGender);

        logger.info(masterVO.toString());
        int updated = totalCustomerService.Update(masterVO);

        if (updated == 1) {
            return "redirect:TotalDataList";
        } else {
            return "error";
        }
    }

}
