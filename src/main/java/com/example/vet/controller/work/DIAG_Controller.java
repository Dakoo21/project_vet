package com.example.vet.controller.work;

import com.example.vet.model.BookingVO;
import com.example.vet.model.diagVO;
import com.example.vet.service.work.DIAG_Service;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import net.minidev.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("diag/*")
public class DIAG_Controller {


    Logger logger = LoggerFactory.getLogger(DIAG_Controller.class);

    private final DIAG_Service diagService;

    public DIAG_Controller(DIAG_Service diagService) {
        this.diagService = diagService;
    }



    //셀렉트문 실행으로 값 받아오기
    @GetMapping("diagList")
    public String SelectList(Model model, @RequestParam Map<String, Object> rmap){

        List<Map<String,Object>> dList = diagService.Select(rmap);
        logger.info(dList.toString());
        logger.info("컨트롤러 리스트");
        model.addAttribute("dList", dList);
        return "pages/customerDB/MedicalLog";
    };

    @GetMapping("diagDetail")
    public String ListDetail(Model model, @RequestParam Map<String, Object> rmap){
        List<Map<String,Object>> dList = diagService.Select(rmap);
        logger.info("컨트롤러 디테일");
        logger.info(dList.toString());
        model.addAttribute("dList", dList);
        return "pages/customerDB/MedicalChart";
    };

    @PostMapping("/diagUpdate")
    public String Update(@RequestParam Map<String, Object> rmap){

        logger.info(rmap.toString());
        diagService.Update(rmap);
        return "redirect:diagList";
    };
    @PostMapping("/diagInsert")
    public String Insert(@RequestParam Map<String, Object> rmap) {

        logger.info(rmap.toString());
        logger.info("diagInsert입니다");
        List<Map<String, Object>> sList = diagService.Insert(rmap);
        Map<String, Object> amap = sList.get(0);
        return "redirect:diagDetail?diagPk="+amap.get("DIAG_PK").toString();
    }

    @PostMapping("/diagServiceInsert")
    public String ServiceInsert(@RequestBody List<Map<String, Object>> formData2) {
        Gson gson = new Gson();
        String json = gson.toJson(formData2);
        logger.info(json);

        // 변환된 List<Map>을 순회하며 로깅합니다.
        for (Map<String, Object> map : formData2) {
            logger.info(map.toString());

            // 정수 값으로 변환하여 사용
            String diagPk = (String) map.get("diagPk");
            Map<String, Object> rmap = new HashMap<>();
            rmap.put("diagPk", Integer.parseInt(diagPk));

            Object servicePk = map.get("servicePk");
            if (servicePk instanceof Number) {
                int intValue = ((Number) servicePk).intValue();
                rmap.put("servicePk", intValue);
                logger.info("servicePk: " + intValue);
                diagService.Insert(rmap);
            }

        }
        return "redirect:diagList";
    }



    @ResponseBody
    @GetMapping("/GetServiceCost")
    public List<Map<String, Object>> selectCost(@RequestParam Map<String, Object> rmap) {
        logger.info(rmap.toString());
        List<Map<String, Object>> mList = diagService.SelectCost(rmap);
        logger.info(mList.toString());
        return mList;
    }
    public String Delete(){

        return null;
    };

}

