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
// public class Api3_Controller {
//
//     /**
//      * 오픈 API 서버에서 데이터를 가져와서 알맞은 데이터 포맷으로 파싱하는 역할만 수행
//      */
//
//     /**
//      * 핵심 조회 메소드
//      */
//     // 지역 기반 조회
//     public List<MissedAnimal> fetchByAreaCode(int areaCode, int numOfRows) {
//         String areaUrl = makeAreaUrl(areaCode, numOfRows);
//         return fetch(areaUrl);
//     }
//
//     // 문화 기반 조회
//     public List<MissedAnimal> fetchByContent(int contentTypeId, int numOfRows) {
//         String contentUrl = makeContentUrl(contentTypeId, numOfRows);
//         log.info("content URL = {}", contentUrl);
//         return fetch(contentUrl);
//     }
//
//     // 지역 + 문화 기반 조회
//     public List<MissedAnimal> fetchByAreaContent(int areaCode, int contentTypeId, int numOfRows) {
//         String positionUrl = makeAreaContentUrl(areaCode, contentTypeId, numOfRows);
//         return fetch(positionUrl);
//     }
//
//     // 현재 위치 기반 조회
//     public List<MissedAnimal> fetchByPosition(double mapX, double mapY, int radius, int numOfRows) {
//         String positionUrl = makePositionUrl(mapX, mapY, radius, numOfRows);
//         return fetch(positionUrl);
//     }
//
//     /**
//      * 편의 private 메소드들
//      */
//     // 기본 URL 만들기
//     private String makeBaseUrl(String apiUriType) {
//         return OpenApiConst.ENDPOINT + apiUriType + OpenApiConst.SERVICE_KEY + OpenApiConst.DEFAULT_QUERY_PARAMS + OpenApiConst.SORT_BY_POPULAR;
//     }
//
//     // 지역 기반 URL 만들기
//     private String makeAreaUrl(int areaCode, int numOfRows) {
//         return makeBaseUrl(BasedList.AREA_BASED) +
//                 setNumOfRows(numOfRows) +
//                 setAreaCode(areaCode);
//     }
//
//     // 현재 위치 중심 URL 만들기
//     private String makePositionUrl(double mapX, double mapY, int radius, int numOfRows) {
//         return makeBaseUrl(BasedList.LOCATION_BASED) +
//                 setNumOfRows(numOfRows) +
//                 setPosition(mapX, mapY, radius);
//     }
//
//     // 문화 기반 URL 만들기
//     private String makeContentUrl(int contentTypeId, int numOfRows) {
//         return makeBaseUrl(BasedList.AREA_BASED) +
//                 setNumOfRows(numOfRows) +
//                 setContentTypeId(contentTypeId);
//     }
//
//     // 지역 + 문화 기반 URL 만들기
//     private String makeAreaContentUrl(int areaCode, int contentTypeId, int numOfRows) {
//         return makeBaseUrl(BasedList.AREA_BASED) +
//                 setNumOfRows(numOfRows) +
//                 setAreaCode(areaCode) +
//                 setContentTypeId(contentTypeId);
//     }
//
//
//     // 지역 코드 입력
//     private String setAreaCode(int code) {
//         return "&areaCode=" + code;
//     }
//
//     // 가져올 데이터 수 정하기
//     private String setNumOfRows(int n) {
//         if (n < 0 || n > 10000) {
//             // 범위를 넘어가면 디폴트값 내리기
//             return "&numOfRows=10";
//         }
//         return "&numOfRows=" + n;
//     }
//
//     // 컨텐츠 타입 지정하기
//     private String setContentTypeId(int code) {
//         return "&contentTypeId=" + code;
//     }
//
//     // 위치 정보 입력
//     private String setPosition(double mapX, double mapY, int radius) {
//         return "&mapX=" + mapX + "&mapY=" + mapY + "&radius=" + radius;
//     }
//
//     // 오픈 API 서버로부터 데이터 받아오기
//     public List<MissedAnimal> fetch(String url) {
//         List<MissedAnimal> result = new ArrayList<>();
//         try {
//             RestTemplate restTemplate = new RestTemplate();
//             String jsonString = restTemplate.getForObject(url, String.class);
//             JSONParser jsonParser = new JSONParser();
//             JSONObject jsonObject = (JSONObject) jsonParser.parse(jsonString);
//             // 가장 큰 JSON 객체 response 가져오기
//             JSONObject jsonResponse = (JSONObject) jsonObject.get("response");
//             log.info("response 파싱 완료 = {}", jsonResponse);
//
//             // 그 다음 body 부분 파싱
//             JSONObject jsonBody = (JSONObject) jsonResponse.get("body");
//             log.info("response->body 파싱 완료 = {}", jsonBody);
//
//             // 그 다음 위치 정보를 배열로 담은 items 파싱
//             JSONObject jsonItems = (JSONObject) jsonBody.get("items");
//             log.info("response->body->items 파싱 완료 = {}", jsonItems);
//
//             // items 는 JSON 임, 이제 그걸 또 배열로 가져온다
//             JSONArray jsonItemList = (JSONArray) jsonItems.get("item");
//             log.info("response->body->items->item 파싱 완료 = {}", jsonItemList);
//
//             for (Object o : jsonItemList) {
//                 JSONObject item = (JSONObject) o;
//                 MissedAnimal dto = makeLocationDto(item);
//                 if (dto == null) continue;
//                 result.add(dto);
//                 log.info("{}", makeLocationDto(item));
//             }
//             log.info("fetch 완료");
//             return result;
//         } catch (Exception e) {
//             throw new OpenApiException("오픈 API 예외 = fetch 로 가져온 데이터가 비어있음 (데이터 요청 방식 오류)");
//         } finally {
//             return result;
//         }
//     }
//
//     // 콘텐츠 정보 JSON 을 DTO 로 변환
//     private MissedAnimal makeLocationDto(JSONObject item) {
//         // 가끔 좌표 데이터가 타입이 다른경우 처리
//         if (item.get("mapx") instanceof String || item.get("mapy") instanceof String
//                 || item.get("addr1") == null || item.get("firstimage") == null
//                 || item.get("areacode") == null || item.get("contenttypeid") == null || item.get("title") == null) {
//             return null;
//         }
//         return dto.builder().
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
//     }
// }
