package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Sign {
    private Integer SIGN_PK;
    private String SIGN_TITLE;
    private String SIGN_CONTENT;
    private String SIGN_DATE;
    private String SIGN_RESERV_YEAR;
    private String SIGN_TYPE;
    private Integer MEMBER_PK;
    private Integer ADOPT_PK;
    private String selectedvalue;

    public Sign(Integer SIGN_PK, String SIGN_TITLE, String SIGN_CONTENT, String SIGN_DATE, String SIGN_RESERV_YEAR, String SIGN_TYPE, Integer MEMBER_PK, Integer ADOPT_PK, String selectedvalue) {
        this.SIGN_PK = SIGN_PK;
        this.SIGN_TITLE = SIGN_TITLE;
        this.SIGN_CONTENT = SIGN_CONTENT;
        this.SIGN_DATE = SIGN_DATE;
        this.SIGN_RESERV_YEAR = SIGN_RESERV_YEAR;
        this.SIGN_TYPE = SIGN_TYPE;
        this.MEMBER_PK = MEMBER_PK;
        this.ADOPT_PK = ADOPT_PK;
        this.selectedvalue = selectedvalue;
    }





}
