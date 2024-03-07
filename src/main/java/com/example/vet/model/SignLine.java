package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SignLine {
    private Integer SIGN_PK;
    private Integer LV1;
    private Integer LV2;
    private Integer LV3;
    private Integer MEMBER_PK;
    private Integer SIGN_STATE;


    @Builder
    public SignLine(Integer SIGN_PK, Integer LV1, Integer LV2, Integer LV3, Integer MEMBER_PK, Integer SIGN_STATE){
        this.SIGN_PK = SIGN_PK;
        this.LV1 = LV1;
        this.LV2 = LV2;
        this.LV3 = LV3;
        this.MEMBER_PK = MEMBER_PK;
        this.SIGN_STATE = SIGN_STATE;
    }
}
