// package com.example.vet.test.abandonTest;
//
// import com.example.vet.model.adopt.MissedAnimal;
// import com.fasterxml.jackson.core.type.TypeReference;
// import com.fasterxml.jackson.databind.JsonNode;
// import com.fasterxml.jackson.databind.ObjectMapper;
// import com.google.gson.Gson;
// import com.google.gson.JsonArray;
// import com.google.gson.reflect.TypeToken;
// import com.nimbusds.oauth2.sdk.util.OrderedJSONObject;
// import lombok.extern.slf4j.Slf4j;
// import net.minidev.json.JSONObject;
// import net.minidev.json.parser.JSONParser;
// import net.minidev.json.parser.ParseException;
// import org.springframework.stereotype.Controller;
// import org.springframework.stereotype.Service;
// import org.springframework.web.bind.annotation.GetMapping;
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
// @Controller
// @Slf4j
// public class Api_Controller {
//
//     @GetMapping("apitest")
//         public String apitest() throws IOException, ParseException {
//             log.info("apitest 호출");
//             StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /*URL*/
//             urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=GKS3TpVkUwY2BLfLRtV5uv0muDROfpeuMQ78gChyNyh7pBJk4Bcl90i0lBGFFlBrEeA/295vR7ociL4agPVacQ=="); /*Service Key*/
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
//             line = sb.toString();
//             String jsonString = line;
//             ObjectMapper objectMapper;
//             objectMapper = new ObjectMapper();
//             JsonNode jsonNode = objectMapper.readTree(jsonString);
//             JsonNode itemsNode = jsonNode.get("items");
//             if(itemsNode != null && itemsNode.isArray()){
//                 List<MissedAnimal> missedAnimalList = objectMapper.readValue(
//                         itemsNode.toString(),
//                         new TypeReference<List<MissedAnimal>>() {
//                         }
//                 );
//                 for(MissedAnimal animalMissed : missedAnimalList) {
//                     System.out.println("animalMissed.getAge() = " + animalMissed.getAge());
//                 }
//
//             }
//
//         // JSONParser parser = new JSONParser();
//         // JSONObject obj = (JSONObject) parser.parse(line);
//             rd.close();
//             conn.disconnect();
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
//             return sb.toString();
//     }
//
// }
