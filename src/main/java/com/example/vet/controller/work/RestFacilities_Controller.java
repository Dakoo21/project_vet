package com.example.vet.controller.work;


import com.example.vet.service.work.Facilities_Service;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;
import java.util.Map;



@RestController
@RequestMapping("/reservespot/*")
public class RestFacilities_Controller {

    private static Logger logger = LoggerFactory.getLogger(Facilities_Controller.class);
    private Facilities_Service facilitiesService;
    public RestFacilities_Controller(Facilities_Service facilitiesService){
        this.facilitiesService =facilitiesService;
    }


    @GetMapping("/animalList")

    public String animalList(@RequestParam String animalNm, HttpServletRequest req) {
        // -> http://localhost:8000/notice/jsonNoticeList?gubun=n_title&keyword=휴관
        logger.info( animalNm);// n_title or n_writer or n_content , keyword=휴관
        List<Map<String, Object>> list = null;
        list = facilitiesService.animalList(animalNm);
        logger.info(list.toString());
        // List, Map - > JSON 변경하기, JSON -> List, Map, JSON -> Array
        Gson g = new Gson();// 오픈소스(해커뉴스, 유튜브, 날씨 API)API - JSON형식 데이터셋 다양하게 관찰
        String temp = g.toJson(list);// 파라미터로 받은 List<Map<>>형태를 JSON형식으로 전환해줌,전환해주는 함수 ==to.json
        return temp;
    }
}