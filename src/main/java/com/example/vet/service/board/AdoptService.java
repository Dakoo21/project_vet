package com.example.vet.service.board;


import com.example.vet.config.rest_template.RestTemplateConfig;
import com.example.vet.model.adopt.MissedAnimalReqVO;
import com.example.vet.model.adopt.MissingAnimalResVO;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

@Service
@RequiredArgsConstructor
public class AdoptService {

    private final RestTemplateConfig restTemplateConfig;

    public MissingAnimalResVO getMissedAnimal(MissedAnimalReqVO reqVO){
        String url = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic";
        String key = "lEeq8XMbXQj%2B2g%2BUio5fX1q0NYDwSfIAzHJNv3Uf9pABbQsTJZPpNda184SYmT8bxUhvlf4zoyXN%2F6BavDz3jQ%3D%3D";

        MissedAnimalReqVO missedAnimalReqVO = new MissedAnimalReqVO(key,"20211201","20211231","1","10");

        XmlMapper xmlMapper = new XmlMapper();

        UriComponents uriComponents  = UriComponentsBuilder
                .fromPath(url)
                .queryParam("bgnde", missedAnimalReqVO.getBgnde())
                .queryParam("endde", missedAnimalReqVO.getEndde())
                .queryParam("pageNo",missedAnimalReqVO.getPageNo())
                .queryParam("numOfRows",missedAnimalReqVO.getNumOfRows())
                .queryParam("serviceKey",missedAnimalReqVO.getServiceKey())
                .build();

            String str   = restTemplateConfig.restTemplate()
                .getForObject(uriComponents.toUriString(), String.class);

            System.out.println(str);
        return new MissingAnimalResVO();
    }

}
