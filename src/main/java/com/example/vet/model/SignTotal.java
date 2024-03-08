package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SignTotal {
    private Integer SIGN_PK;
    private String SIGN_TITLE;
    private String SIGN_CONTENT;
    private String SIGN_DATE;
    private String SIGN_RESERV_YEAR;
    private String SIGN_DOCTYPE;
    private Integer MEMBER_PK;
    private Integer ADOPT_PK;
    private String ADOPT_NM;
    private String ADOPT_BDATE;
    private String ADOPT_SPECIES;
    private String ADOPT_BREED;
    private String ADOPT_WEIGHT;
    private String ADOPT_SEX;
    private String ADOPT_NEUT;
    private Integer MASTERPK;
    private String ADOPT_REASON;
    private Integer LV_1;
    private Integer LV_2;
    private Integer LV_3;
    private Integer SIGN_STATE;
    private String MASTER_NAME;

    @Builder
    public SignTotal(Integer SIGN_PK, String SIGN_TITLE, String SIGN_CONTENT, String SIGN_DATE, String SIGN_RESERV_YEAR, String SIGN_DOCTYPE, Integer MEMBER_PK, Integer ADOPT_PK, String ADOPT_NM, String ADOPT_BDATE, String ADOPT_SPECIES, String ADOPT_BREED, String ADOPT_WEIGHT, String ADOPT_SEX, String ADOPT_NEUT, Integer MASTERPK, String ADOPT_REASON, Integer LV_1, Integer LV_2, Integer LV_3, Integer SIGN_STATE, String MASTER_NAME) {
        this.SIGN_PK = SIGN_PK;
        this.SIGN_TITLE = SIGN_TITLE;
        this.SIGN_CONTENT = SIGN_CONTENT;
        this.SIGN_DATE = SIGN_DATE;
        this.SIGN_RESERV_YEAR = SIGN_RESERV_YEAR;
        this.SIGN_DOCTYPE = SIGN_DOCTYPE;
        this.MEMBER_PK = MEMBER_PK;
        this.ADOPT_PK = ADOPT_PK;
        this.ADOPT_NM = ADOPT_NM;
        this.ADOPT_BDATE = ADOPT_BDATE;
        this.ADOPT_SPECIES = ADOPT_SPECIES;
        this.ADOPT_BREED = ADOPT_BREED;
        this.ADOPT_WEIGHT = ADOPT_WEIGHT;
        this.ADOPT_SEX = ADOPT_SEX;
        this.ADOPT_NEUT = ADOPT_NEUT;
        this.MASTERPK = MASTERPK;
        this.ADOPT_REASON = ADOPT_REASON;
        this.LV_1 = LV_1;
        this.LV_2 = LV_2;
        this.LV_3 = LV_3;
        this.SIGN_STATE = SIGN_STATE;
        this.MASTER_NAME=MASTER_NAME;
    }

}
