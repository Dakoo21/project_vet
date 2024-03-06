// package com.example.vet.test.abandonTest;
//
// import com.example.vet.model.adopt.MissedAnimal;
// import lombok.RequiredArgsConstructor;
// import lombok.extern.slf4j.Slf4j;
// import net.minidev.json.JSONArray;
// import net.minidev.json.JSONObject;
// import net.minidev.json.parser.JSONParser;
// import org.springframework.http.HttpEntity;
// import org.springframework.http.HttpHeaders;
// import org.springframework.http.HttpMethod;
// import org.springframework.http.ResponseEntity;
// import org.springframework.stereotype.Component;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.RestController;
// import org.springframework.web.client.RestTemplate;
//
// import java.io.UnsupportedEncodingException;
// import java.text.ParseException;
// import java.util.ArrayList;
// import java.util.List;
// import java.util.Map;
//
// import static org.springframework.security.oauth2.core.OAuth2TokenValidatorResult.success;
//
//
// @Component
// @RequiredArgsConstructor
// @Slf4j
// public class Api2_Controller {
//     private final OpenApiManager openApiManager;
//
//     @GetMapping("open-api")
//     public ResponseEntity<?> fetch() throws UnsupportedEncodingException {
//         return success(openApiManager.fetch().getBody());
//     }
//
//     @Component
//     public class OpenApiManager {
//         private final String BASE_URL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService";
//         private final String apiUri = "/areaBasedList";
//         private final String serviceKey = "?ServiceKey=디코딩 서비스 키";
//         private final String defaultQueryParam = "&MobileOS=ETC&MobileApp=AppTest&_type=json";
//         private final String numOfRows = "&numOfRows=100";
//         private final String areaCode = "&areaCode=1";
//         private final String contentTypeId = "&contentTypeId=12";
//
//
//         private String makeUrl() throws UnsupportedEncodingException {
//             return BASE_URL +
//                     apiUri +
//                     serviceKey +
//                     defaultQueryParam +
//                     numOfRows +
//                     areaCode +
//                     contentTypeId;
//         }
//
//         public ResponseEntity<?> fetch() throws UnsupportedEncodingException {
//             System.out.println(makeUrl());
//             RestTemplate restTemplate = new RestTemplate();
//             HttpEntity<?> entity = new HttpEntity<>(new HttpHeaders());
//             ResponseEntity<Map> resultMap = restTemplate.exchange(makeUrl(), HttpMethod.GET, entity, Map.class);
//             System.out.println(resultMap.getBody());
//             return resultMap;
//
//         }
//     }
//     public List<MissedAnimal> fetch() throws ParseException {
//         RestTemplate restTemplate = new RestTemplate();
//         String jsonString = restTemplate.getForObject(makeUrl(), String.class);
//         JSONParser jsonParser = new JSONParser();
//         JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
//         // 가장 큰 JSON 객체 response 가져오기
//         JSONObject jsonResponse = (JSONObject) jsonObject.get("response");
//
//         // 그 다음 body 부분 파싱
//         JSONObject jsonBody = (JSONObject) jsonResponse.get("body");
//
//         // 그 다음 위치 정보를 배열로 담은 items 파싱
//         JSONObject jsonItems = (JSONObject) jsonBody.get("items");
//
//         // items는 JSON임, 이제 그걸 또 배열로 가져온다
//         JSONArray jsonItemList = (JSONArray) jsonItems.get("item");
//
//         List<MissedAnimal> result = new ArrayList<>();
//
//         for (Object o : jsonItemList) {
//             JSONObject item = (JSONObject) o;
//             result.add(makeLocationDto(item));
//         }
//         return result;
//     }
//     // 콘텐츠 정보 JSON을 DTO로 변환
//     private MissedAnimal makeLocationDto(JSONObject item) {
//         MissedAnimal dto = MissedAnimal.builder().
//                 desertion_no((Integer) item.get("desertionNo")).
//                 filename((String) item.get("filename")).
//                 happendate((String) item.get("happenDt")).
//                 happenplace((String) item.get("happenPlace")).
//                 kindcd((String) item.get("kindCd")).
//                 colorcd((String) item.get("colorCd")).
//                 age((String) item.get("age")).
//                 weight((String) item.get("weight")).
//                 notice_no((String) item.get("noticeNo")).
//                 noticestartdate((String) item.get("noticeSdt")).
//                 noitceenddate((String) item.get("noticeEdt")).
//                 popfile((String) item.get("popfile")).
//                 processstate((String) item.get("processState")).
//                 sex((String) item.get("sexCd")).
//                 neuteral_yesorno((String) item.get("neuterYn")).
//                 specialmark((String) item.get("specialMark")).
//                 care_nm((String) item.get("careNm")).
//                 care_tel((String) item.get("careTel")).
//                 care_address((String) item.get("careAddr")).
//                 org_nm((String) item.get("orgNm")).
//                 charge_nm((String) item.get("chargeNm")).
//                 office_tel((String) item.get("officetel")).
//                 build();
//         return dto;
//     }
// }
