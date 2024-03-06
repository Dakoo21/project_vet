package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SignLine {
    private Integer sign_pk;
    private Integer lv1;
    private Integer lv2;
    private Integer lv3;
    private Integer member_pk;
    private Integer sign_state;


    @Builder
    public SignLine(Integer sign_pk, Integer lv1, Integer lv2, Integer lv3, Integer member_pk, Integer sign_state){
        this.sign_pk = sign_pk;
        this.lv1 = lv1;
        this.lv2 = lv2;
        this.lv3 = lv3;
        this.member_pk = member_pk;
        this.sign_state = sign_state;
    }
}
