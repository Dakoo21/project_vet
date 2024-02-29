package com.example.vet.controller.board;

import com.example.vet.service.board.TotalDataService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("CustomerDB/*")
public class TotalDataController {
    Logger logger = LoggerFactory.getLogger(TotalDataController.class);
    @Autowired
    TotalDataService totalDataService = null;


    @GetMapping("TotalDataList")
    public String dataList(Model model, @RequestParam Map<String, Object> pmap) {
        logger.info("list");
        List<Map<String, Object>> dList = null;
        dList = totalDataService.dataList(pmap);
        model.addAttribute("dList", dList);
        return "pages/customerDB/TotalDataList";
    }

    @GetMapping("TotalDataDetail")
    public String dataDetail(Model model, @RequestParam Map<String, Object> pmap) {
        logger.info("dataDetail");
        List<Map<String, Object>> dList = null;
        dList = totalDataService.dataList(pmap);
        model.addAttribute("dList", dList);
        return "pages/customerDB/TotalDataDetail";
    }

    @PostMapping("TotalDataUpdate")
    public String dataUpdate(@RequestParam Map<String, Object> pmap) {
        logger.info("dataUpdate");
        int result = 0;
        String path = null;
        result = totalDataService.dataUpdate(pmap);
        if (result == 1) {
            path = "pages/customerDB/TotalDataList";
        } else {
            path = "redirect:error";
        }
        return path;
    }

    @PostMapping("TotalDataInsert")
    public String dataInsert(@RequestParam Map<String, Object> pmap) {
        logger.info("dataInsert");
        int result = 0;
        String path = "";
        result = totalDataService.dataInsert(pmap);
        if (result == 1) {
            path = "pages/customerDB/TotalDataInsert";
        } else {
            path = "redirect: error";
        }
        return path;
    }
}
