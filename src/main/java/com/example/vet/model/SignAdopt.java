package com.example.vet.model;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SignAdopt {
    // pk
    private Integer ADOPT_PK;
    // 입양 동물 이름
    private String ADOPT_NM;
    // 입양글 pk
    private Integer DESERTION_NO;
    // 입양동물 생일
    private String ADOPT_BDATE;
    // 입양동물 축종
    private String ADOPT_SPECIES;
    // 입양 동물 품종
    private String ADOPT_BREED;
    private String ADOPT_WEIGHT;
    private String ADOPT_SEX;
    // 중성화 여부
    private String  ADOPT_NEUT;
    // 주인 pk
    private Integer MASTERPK;
    // 입양사유
    private String ADOPT_REASON;

    @Builder
    public SignAdopt(Integer ADOPT_PK, String ADOPT_NM, Integer DESERTION_NO, String ADOPT_BDATE, String ADOPT_SPECIES, String ADOPT_BREED, String ADOPT_WEIGHT, String ADOPT_SEX, String ADOPT_NEUT, Integer MASTERPK, String ADOPT_REASON) {
        this.ADOPT_PK = ADOPT_PK;
        this.ADOPT_NM = ADOPT_NM;
        this.DESERTION_NO = DESERTION_NO;
        this.ADOPT_BDATE = ADOPT_BDATE;
        this.ADOPT_SPECIES = ADOPT_SPECIES;
        this.ADOPT_BREED = ADOPT_BREED;
        this.ADOPT_WEIGHT = ADOPT_WEIGHT;
        this.ADOPT_SEX = ADOPT_SEX;
        this.ADOPT_NEUT = ADOPT_NEUT;
        this.MASTERPK = MASTERPK;
        this.ADOPT_REASON = ADOPT_REASON;
    }




}
