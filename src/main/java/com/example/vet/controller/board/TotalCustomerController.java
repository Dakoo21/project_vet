package com.example.vet.controller.board;

import com.example.vet.model.MasterVO;
import com.example.vet.model.TotalCustomerUpdateVO;
import com.example.vet.service.board.TotalCustomerService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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

    @GetMapping("TotalCustomerSelectedList")
    @ResponseBody
    public List<Map<String, Object>> dataList(@RequestParam(required = false) Map<String, Object> pmap ) {
        MasterVO masterVO = new MasterVO();
        masterVO.setKeyword(pmap.get("keyword").toString());
        List<Map<String, Object>> selected = totalCustomerService.Select(masterVO);
        System.out.println(selected);
        return selected;
    }
    @GetMapping("TotalCustomerDetail")
    public String listDetail(@RequestParam int masterPk, Model model) {
        MasterVO masterVO = new MasterVO();
        masterVO.setMasterPk(masterPk);
        logger.info(masterVO.toString());
//        List<Map<String,Object>>cList = totalCustomerService.Detail(masterVO);
        masterVO = totalCustomerService.Detail(masterVO);
        model.addAttribute("cList", masterVO);
        return "pages/customerDB/TotalCustomerDetail";
    }

    /**
     * 저장하는 화면 가져오는 메소드
     *
     * @return
     */
    @GetMapping("TotalCustomerInsertPage")
    public String insertPage() {
        return "pages/customerDB/TotalCustomerInsert";
    }

    @PostMapping("TotalCustomerInsert")
    public String insert(@RequestBody MasterVO masterVO) {
        logger.info(masterVO.toString());
        int inserted = totalCustomerService.Insert(masterVO);

        if (inserted == 1) {
            return "pages/customerDB/TotalCustomerInsert";
        } else {
            return "error";
        }
    }

    @PostMapping("TotalCustomerUpdate")
    public String update(@RequestBody TotalCustomerUpdateVO totalCustomerUpdateVO) {
        System.out.println(totalCustomerUpdateVO);
        totalCustomerService.update(totalCustomerUpdateVO);

        return "pages/customerDB/TotalCustomerInsert";
    }
}

