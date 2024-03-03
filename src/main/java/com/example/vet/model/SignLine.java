package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SignLine {
    private int sign_pk;
    private int lv1;
    private int lv2;
    private int lv3;
    private int member_pk;
    private int sign_state;


    @Builder
    public SignLine(int sign_pk, int lv1, int lv2, int lv3, int member_pk, int sign_state){
        this.sign_pk = sign_pk;
        this.lv1 = lv1;
        this.lv2 = lv2;
        this.lv3 = lv3;
        this.member_pk = member_pk;
        this.sign_state = sign_state;
    }
}
