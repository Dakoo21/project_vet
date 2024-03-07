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
    public SignLine(Integer sign_pk, Integer lv1, Integer lv2, Integer lv3, Integer member_pk, Integer sign_state){
        this.SIGN_PK = sign_pk;
        this.LV1 = lv1;
        this.LV2 = lv2;
        this.LV3 = lv3;
        this.MEMBER_PK = member_pk;
        this.SIGN_STATE = sign_state;
    }
}
