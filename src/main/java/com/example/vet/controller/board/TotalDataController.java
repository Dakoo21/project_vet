package com.example.vet.controller.board;

import com.example.vet.model.AnimalVO;
import com.example.vet.model.TotalDataUpdateVO;
import com.example.vet.service.board.TotalDataService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("CustomerDB/*")
public class TotalDataController {
    Logger logger = LoggerFactory.getLogger(TotalDataController.class);
    @Autowired
    TotalDataService totalDataService = null;

    /**
     * 리스트
     * @param model
     * @param pmap
     * @return
     */
    @GetMapping("TotalDataList")
    public String dataList(Model model, @RequestParam Map<String, Object> pmap) {
        logger.info("list");
        List<Map<String, Object>> dList = null;
        dList = totalDataService.dataList(pmap);
        model.addAttribute("dList", dList);
        return "pages/customerDB/TotalDataList";
    }

    /**
     *  상세화면
     * @param model
     * @return
     */
    @GetMapping("TotalDataDetail/{animalPk}")
    public String dataDetail(@PathVariable String animalPk,  Model model) {
        logger.info("dataDetail");
        List<Map<String, Object>> dList = null;
        List<Map<String, Object>> diagList = null;

        AnimalVO animalVO = new AnimalVO();
        animalVO.setAnimalPk(Integer.parseInt(animalPk));
        dList = totalDataService.detail(animalVO);
        diagList = totalDataService.selectDiag(Integer.parseInt(animalPk));

        model.addAttribute("dList", dList);
        model.addAttribute("diagList", diagList);

        return "pages/customerDB/TotalDataDetail";
    }

    /**
     * 수정하는 메소드
     * @param totalDataUpdateVO
     * @return
     */
    @PostMapping("TotalDataUpdate")
    public void dataUpdate(@RequestBody TotalDataUpdateVO totalDataUpdateVO) {
        logger.info("dataUpdate");
         totalDataService.dataUpdate(totalDataUpdateVO);
    }

    /**
     *  저장하는 화면 가져오는 메소드
     * @return
     */
    @GetMapping("TotalDataInsertPage")
    public String insertPage(){

        return "pages/customerDB/TotalDataInsert";
    }

    /**
     * 저장 메소드
     * @param
     * @return
     */
    @PostMapping("TotalDataInsert")
    public String dataInsert(@RequestBody AnimalVO animalVO) {
        logger.info("dataInsert");
        int result = 0;
        String path = "";
        result = totalDataService.dataInsert(animalVO);
        if (result == 1) {
            path = "pages/customerDB/TotalDataInsert";
        } else {
            path = "redirect: error";
        }
        return path;
    }
}
