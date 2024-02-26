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


    @GetMapping("diagList")
    public String SelectList(Model model, @RequestParam Map<String, Object> rmap){

        List<Map<String,Object>> dList = diagService.Select(rmap);
        logger.info(dList.toString());
        model.addAttribute("dList", dList);
        return "pages/customerDB/MedicalLog";
    };

    @GetMapping("diagDetail")
    public String ListDetail(Model model, @RequestParam Map<String, Object> rmap){

        List<Map<String,Object>> dList = diagService.Select(rmap);
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
        diagService.Insert(rmap);
        return "redirect:diagList";
    }

    @GetMapping("checkCost")
    public int checkCost(@RequestParam Map<String, Object> servicePk){
        int cost = diagService.SelectCost(servicePk);
        return cost;
    }

    @PostMapping("/diagServiceInsert")
    public String ServiceInsert(@RequestParam Map<String,Object> formData2) {
        // JSON 문자열 추출
        String json = (String) formData2.get("checkList");
        logger.info(json);

        // Gson 라이브러리를 사용하여 JSON 문자열을 List<Map<String, Object>>으로 변환합니다.
        Gson gson = new Gson();
        List<Map<String, Object>> maps = gson.fromJson(json, new TypeToken<List<Map<String, Object>>>(){}.getType());
        logger.info(Arrays.toString(maps.toArray()));

        Map<String, Object> rmap = new HashMap<>();
        // 변환된 List<Map>을 순회하며 로깅합니다.
        for (Map<String, Object> map : maps) {
            logger.info(map.toString());

            // 정수 값으로 변환하여 사용
            String diagPk = (String) map.get("diagPk");
            rmap.put("diagPk", diagPk);

            Object servicePk = map.get("servicePk");
            if (servicePk instanceof Number) {
                int intValue = ((Number) servicePk).intValue();
                rmap.put("servicePk", intValue);
                logger.info("servicePk: " + intValue);
            }
            diagService.Insert(rmap);
        }
        return "redirect:diagList";
    }

    public String Delete(){

        return null;
    };
}
