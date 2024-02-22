package com.example.vet.model.adopt;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class MissedAnimalReqVO {

    private String serviceKey;
    private String bgnde;
    private String endde;
    private String pageNo;
    private String numOfRows;

    public MissedAnimalReqVO(String serviceKey, String bgnde, String endde, String pageNo, String numOfRows){
        this.serviceKey = serviceKey;
        this.bgnde = bgnde;
        this.endde = endde;
        this.pageNo =pageNo;
        this.numOfRows =numOfRows;
    }
}
