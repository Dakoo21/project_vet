// package com.example.vet.test.abandonTest;
//
// import com.example.vet.model.adopt.MissedAnimal;
// import com.fasterxml.jackson.databind.JsonNode;
// import com.fasterxml.jackson.databind.ObjectMapper;
// import lombok.RequiredArgsConstructor;
// import lombok.extern.slf4j.Slf4j;
// import org.json.simple.JSONArray;
// import org.json.simple.JSONObject;
// import org.json.simple.parser.JSONParser;
// // import net.minidev.json.parser.JSONParser;
// // import net.minidev.json.parser.ParseException;
// import org.json.simple.parser.ParseException;
// import org.springframework.stereotype.Controller;
// import org.springframework.stereotype.Service;
// import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.RestController;
//
// import java.io.BufferedReader;
// import java.io.IOException;
// import java.io.InputStreamReader;
// import java.io.UnsupportedEncodingException;
// import java.net.HttpURLConnection;
// import java.net.URL;
// import java.net.URLEncoder;
// import java.util.ArrayList;
// import java.util.List;
//
//
// @RestController
// @RequiredArgsConstructor
// @Slf4j
// public class Api_Controller {
//
//     @GetMapping("apitest")
//         public String apitest() throws IOException, ParseException {
//             log.info("apitest 호출");
//             StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /*URL*/
//             urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=GKS3TpVkUwY2BLfLRtV5uv0muDROfpeuMQ78gChyNyh7pBJk4Bcl90i0lBGFFlBrEeA%2F295vR7ociL4agPVacQ%3D%3D"); /*Service Key*/
//             urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*한 페이지 결과 수(1,000 이하)*/
//             urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
//             urlBuilder.append("&" + URLEncoder.encode("_type", "UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*xml(기본값) 또는 json*/
//             URL url = new URL(urlBuilder.toString());
//             HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//             conn.setRequestMethod("GET");
//             conn.setRequestProperty("Content-type", "application/json");
//             System.out.println("Response code: " + conn.getResponseCode());
//             BufferedReader rd;
//             if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
//                 rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
//             } else {
//                 rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
//             }
//             StringBuilder sb = new StringBuilder();
//             String line;
//             while ((line = rd.readLine()) != null) {
//                 sb.append(line);
//             }
//
//             // line = sb.toString();
//             // String jsonString = line;
//             // ObjectMapper objectMapper;
//             // objectMapper = new ObjectMapper();
//             // JsonNode jsonNode = objectMapper.readTree(jsonString);
//             // JsonNode itemsNode = jsonNode.get("items");
//             // if(itemsNode != null && itemsNode.isArray()){
//             //     List<MissedAnimal> missedAnimalList = objectMapper.readValue(
//             //             itemsNode.toString(),
//             //             new TypeReference<List<MissedAnimal>>() {
//             //             }
//             //     );
//             //     for(MissedAnimal animalMissed : missedAnimalList) {
//             //         System.out.println("animalMissed.getAge() = " + animalMissed.getAge());
//             //     }
//             //
//             // }
//
//         // JSONParser parser = new JSONParser();
//         // JSONObject obj = (JSONObject) parser.parse(line);
//             rd.close();
//             conn.disconnect();
//             System.out.println("sb.toString() = " + sb.toString());
//         String jsonString = sb.toString();
//
//         try {
//             // ObjectMapper 인스턴스 생성
//             ObjectMapper objectMapper = new ObjectMapper();
//
//             // JSON 문자열 파싱
//             JsonNode jsonNode = objectMapper.readTree(jsonString);
//
//             // "body" -> "items"에서 "item" 배열 추출
//             JsonNode itemsNode = jsonNode
//                     .get("response")
//                     .get("body")
//                     .get("items")
//                     .get("item");
//
//             // "item" 배열을 반복하면서 정보 추출
//             for (JsonNode itemNode : itemsNode) {
//                 List<MissedAnimal> mList = new ArrayList<>();
//                 MissedAnimal missedAnimal = new MissedAnimal();
//                 // 개별 필드 추출
//                 String desertionNo = itemNode.get("desertionNo").asText();
//                 missedAnimal.setDesertion_no(Integer.valueOf(desertionNo));
//                 String filename = itemNode.get("filename").asText();
//                 missedAnimal.setDesertion_no(Integer.valueOf(filename));
//                 String happendate = itemNode.get("happendate").asText();
//                 missedAnimal.setDesertion_no(Integer.valueOf(happendate));
//                 String happenplace = itemNode.get("happenplace").asText();
//                 missedAnimal.setDesertion_no(Integer.valueOf(happenplace));
//                 String kindcd = itemNode.get("kindcd").asText();
//                 missedAnimal.setDesertion_no(Integer.valueOf(kindcd));
//                 String colorcd = itemNode.get("colorcd").asText();
//                 missedAnimal.setDesertion_no(Integer.valueOf(colorcd));
//                 String age = itemNode.get("age").asText();
//                 missedAnimal.setDesertion_no(Integer.valueOf(age));
//                 String weight = itemNode.get("weight").asText();
//                 missedAnimal.setDesertion_no(Integer.valueOf(weight));
//                 String notice_no = itemNode.get("notice_no").asText();
//                 missedAnimal.setDesertion_no(Integer.valueOf(notice_no));
//                 String noticestartdate = itemNode.get("noticestartdate").asText();
//                 missedAnimal.setDesertion_no(Integer.valueOf(noticestartdate));
//                 String noticeenddate = itemNode.get("noticeenddate").asText();
//                 missedAnimal.setDesertion_no(Integer.valueOf(noticeenddate));
//                 String profile = itemNode.get("filename").asText();
//                 // 다른 필드도 유사하게 추출...
//
//                 // 필요에 따라 추출한 정보를 출력하거나 사용합니다.
//                 System.out.println("유기번호: " + desertionNo);
//                 System.out.println("파일이름: " + filename);
//                 // 다른 필드도 유사하게 출력하거나 사용합니다.
//             }
//         } catch (Exception e) {
//             e.printStackTrace();
//         }
//         /**
//          * REST API return 데이터 추출
//          */
//         JSONParser jsonParser = new JSONParser();
//
// //JSON데이터를 넣어 JSON Object 로 만들어 준다.
//         JSONObject jsonObject = (JSONObject)jsonParser.parse(sb.toString());
//
// //배열 추출
//         JSONArray array = (JSONArray) jsonObject.get("items");
//         for(int i=0; i<2; i++){
//
//             System.out.println("hsmp_"+i+" ===========================================");
//
//             //배열 안에 있는것도 JSON형식 이기 때문에 JSON Object 로 추출
//             JSONObject object = (JSONObject) array.get(i);
//
//             //JSON name으로 추출
//             System.out.println("desertionNo ==> "+object.get("desertionNo"));
//             System.out.println("filename ==> "+object.get("filename"));
//             // System.out.println("signguNm ==> "+object.get("signguNm"));
//             // System.out.println("rnAdres ==> "+object.get("rnAdres"));
//             // System.out.println("suplyTyNm ==> "+object.get("suplyTyNm"));
//             System.out.println("");
//
//         }
//             // JsonArray jsonArray = new JsonArray();
//             // System.out.println(sb.toString());
//             // Gson gson = new Gson();
//             // List<MissedAnimal> mList = gson.fromJson(String.valueOf(sb), new TypeToken<ArrayList<MissedAnimal>>(){}.getType());
//             // List<MissedAnimal> missedAnimalList = onvertApiResponseToMissedAnimals(sb.toString());
//             // log.info(mList.toString());
//             // List<MissedAnimal> mList = new ArrayList<>();
//             // mList.add(sb.toString());
//             // for (MissedAnimal missedAnimal : missedAnimals) {
//             //     missedAnimalService.saveMissedAnimal(missedAnimal);
//             // }
//
//             return null;
//     }
//
// }
